import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';

part 'users.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 3,max: 32)();
  TextColumn get soname => text().withLength(min: 3,max: 32).nullable()();
  TextColumn get s_name => text().withLength(min: 3,max: 32).nullable()();
  DateTimeColumn get dateBirth => dateTime().nullable()();
  TextColumn get photo => text().nullable()();
  TextColumn get phone => text().withLength(min: 11, max: 11).nullable()();
  TextColumn get card => text().withLength(min: 16, max: 16).nullable()();
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

  Future<List<User>> get allUserEntries => select(users).get();
  Future<int> insertUser(User user) => into(users).insert(user);
  Stream<List<User>> get userStream => select(users).watch();
  Future<User> getUserById(int id) =>
      (select(users)..where((e) => e.id.equals(id))).getSingle();

  @override
  int get schemaVersion => 1;

}