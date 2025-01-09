// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppStateModelAdapter extends TypeAdapter<AppStateModel> {
  @override
  final int typeId = 0;

  @override
  AppStateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppStateModel(
      counter: fields[0] as int?,
      switcher: fields[1] as bool?,
      text: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AppStateModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.counter)
      ..writeByte(1)
      ..write(obj.switcher)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppStateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
