import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';

part 'users.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 3,max: 32)();
  TextColumn get soname => text().withLength(min:0, max: 32).nullable()();
  TextColumn get s_name => text().withLength(min:0, max: 32).nullable()();
  DateTimeColumn get dateBirth => dateTime().nullable()();
  TextColumn get photo => text().nullable()();
  TextColumn get phone => text().withLength(min: 0, max: 11).nullable()();
  TextColumn get card => text().withLength(min: 0, max: 16).nullable()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Users])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  Future<User?> get lastUser => (select(users)
      ..orderBy([(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
      ..limit(1)
  ).getSingle();

  Future<List<User>> get allUserEntries => select(users).get();
  Future<int> insertUser(User user) => into(users).insert(user);
  Future<int> insert(UsersCompanion user) => into(users).insert(user);
  Stream<List<User>> get userStream => select(users).watch();
  Future<User> getUserById(int id) =>
      (select(users)..where((e) => e.id.equals(id))).getSingle();
  void deleteAll() => delete(users).go(); //..where((u) => u.id.equals(1))).go();
  void deleteUser(User user) => (delete(users)..where((u) => u.id.equals(user.id))).go();
  void updateUser(User user) => update(users).replace(user);

  @override
  int get schemaVersion => 1;
}