// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppStateAdapter extends TypeAdapter<AppState> {
  @override
  final int typeId = 0;

  @override
  AppState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppState(
      auth_local: fields[0] as bool?,
      auto_login: fields[1] as bool?,
      counter: fields[2] as int?,
      switcher: fields[3] as bool?,
      text: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AppState obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.auth_local)
      ..writeByte(1)
      ..write(obj.auto_login)
      ..writeByte(2)
      ..write(obj.counter)
      ..writeByte(3)
      ..write(obj.switcher)
      ..writeByte(4)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
