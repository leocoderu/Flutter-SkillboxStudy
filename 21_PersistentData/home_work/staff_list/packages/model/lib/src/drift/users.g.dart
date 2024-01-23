// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _sonameMeta = const VerificationMeta('soname');
  @override
  late final GeneratedColumn<String> soname = GeneratedColumn<String>(
      'soname', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _s_nameMeta = const VerificationMeta('s_name');
  @override
  late final GeneratedColumn<String> s_name = GeneratedColumn<String>(
      's_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _dateBirthMeta =
      const VerificationMeta('dateBirth');
  @override
  late final GeneratedColumn<DateTime> dateBirth = GeneratedColumn<DateTime>(
      'date_birth', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
      'photo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 11, maxTextLength: 11),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _cardMeta = const VerificationMeta('card');
  @override
  late final GeneratedColumn<String> card = GeneratedColumn<String>(
      'card', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 16, maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, soname, s_name, dateBirth, photo, phone, card];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('soname')) {
      context.handle(_sonameMeta,
          soname.isAcceptableOrUnknown(data['soname']!, _sonameMeta));
    }
    if (data.containsKey('s_name')) {
      context.handle(_s_nameMeta,
          s_name.isAcceptableOrUnknown(data['s_name']!, _s_nameMeta));
    }
    if (data.containsKey('date_birth')) {
      context.handle(_dateBirthMeta,
          dateBirth.isAcceptableOrUnknown(data['date_birth']!, _dateBirthMeta));
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('card')) {
      context.handle(
          _cardMeta, card.isAcceptableOrUnknown(data['card']!, _cardMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      soname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}soname']),
      s_name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}s_name']),
      dateBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_birth']),
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      card: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String? soname;
  final String? s_name;
  final DateTime? dateBirth;
  final String? photo;
  final String? phone;
  final String? card;
  const User(
      {required this.id,
      required this.name,
      this.soname,
      this.s_name,
      this.dateBirth,
      this.photo,
      this.phone,
      this.card});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || soname != null) {
      map['soname'] = Variable<String>(soname);
    }
    if (!nullToAbsent || s_name != null) {
      map['s_name'] = Variable<String>(s_name);
    }
    if (!nullToAbsent || dateBirth != null) {
      map['date_birth'] = Variable<DateTime>(dateBirth);
    }
    if (!nullToAbsent || photo != null) {
      map['photo'] = Variable<String>(photo);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || card != null) {
      map['card'] = Variable<String>(card);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      soname:
          soname == null && nullToAbsent ? const Value.absent() : Value(soname),
      s_name:
          s_name == null && nullToAbsent ? const Value.absent() : Value(s_name),
      dateBirth: dateBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateBirth),
      photo:
          photo == null && nullToAbsent ? const Value.absent() : Value(photo),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      card: card == null && nullToAbsent ? const Value.absent() : Value(card),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      soname: serializer.fromJson<String?>(json['soname']),
      s_name: serializer.fromJson<String?>(json['s_name']),
      dateBirth: serializer.fromJson<DateTime?>(json['dateBirth']),
      photo: serializer.fromJson<String?>(json['photo']),
      phone: serializer.fromJson<String?>(json['phone']),
      card: serializer.fromJson<String?>(json['card']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'soname': serializer.toJson<String?>(soname),
      's_name': serializer.toJson<String?>(s_name),
      'dateBirth': serializer.toJson<DateTime?>(dateBirth),
      'photo': serializer.toJson<String?>(photo),
      'phone': serializer.toJson<String?>(phone),
      'card': serializer.toJson<String?>(card),
    };
  }

  User copyWith(
          {int? id,
          String? name,
          Value<String?> soname = const Value.absent(),
          Value<String?> s_name = const Value.absent(),
          Value<DateTime?> dateBirth = const Value.absent(),
          Value<String?> photo = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> card = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        soname: soname.present ? soname.value : this.soname,
        s_name: s_name.present ? s_name.value : this.s_name,
        dateBirth: dateBirth.present ? dateBirth.value : this.dateBirth,
        photo: photo.present ? photo.value : this.photo,
        phone: phone.present ? phone.value : this.phone,
        card: card.present ? card.value : this.card,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('soname: $soname, ')
          ..write('s_name: $s_name, ')
          ..write('dateBirth: $dateBirth, ')
          ..write('photo: $photo, ')
          ..write('phone: $phone, ')
          ..write('card: $card')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, soname, s_name, dateBirth, photo, phone, card);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.soname == this.soname &&
          other.s_name == this.s_name &&
          other.dateBirth == this.dateBirth &&
          other.photo == this.photo &&
          other.phone == this.phone &&
          other.card == this.card);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> soname;
  final Value<String?> s_name;
  final Value<DateTime?> dateBirth;
  final Value<String?> photo;
  final Value<String?> phone;
  final Value<String?> card;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.soname = const Value.absent(),
    this.s_name = const Value.absent(),
    this.dateBirth = const Value.absent(),
    this.photo = const Value.absent(),
    this.phone = const Value.absent(),
    this.card = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.soname = const Value.absent(),
    this.s_name = const Value.absent(),
    this.dateBirth = const Value.absent(),
    this.photo = const Value.absent(),
    this.phone = const Value.absent(),
    this.card = const Value.absent(),
  }) : name = Value(name);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? soname,
    Expression<String>? s_name,
    Expression<DateTime>? dateBirth,
    Expression<String>? photo,
    Expression<String>? phone,
    Expression<String>? card,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (soname != null) 'soname': soname,
      if (s_name != null) 's_name': s_name,
      if (dateBirth != null) 'date_birth': dateBirth,
      if (photo != null) 'photo': photo,
      if (phone != null) 'phone': phone,
      if (card != null) 'card': card,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? soname,
      Value<String?>? s_name,
      Value<DateTime?>? dateBirth,
      Value<String?>? photo,
      Value<String?>? phone,
      Value<String?>? card}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      soname: soname ?? this.soname,
      s_name: s_name ?? this.s_name,
      dateBirth: dateBirth ?? this.dateBirth,
      photo: photo ?? this.photo,
      phone: phone ?? this.phone,
      card: card ?? this.card,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (soname.present) {
      map['soname'] = Variable<String>(soname.value);
    }
    if (s_name.present) {
      map['s_name'] = Variable<String>(s_name.value);
    }
    if (dateBirth.present) {
      map['date_birth'] = Variable<DateTime>(dateBirth.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (card.present) {
      map['card'] = Variable<String>(card.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('soname: $soname, ')
          ..write('s_name: $s_name, ')
          ..write('dateBirth: $dateBirth, ')
          ..write('photo: $photo, ')
          ..write('phone: $phone, ')
          ..write('card: $card')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}
