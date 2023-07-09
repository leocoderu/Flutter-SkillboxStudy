// Model of Unit
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

const _pName = 'name';         // String     Name of Units like: kg / pic

@freezed
class Unit with _$Unit{

  const factory Unit(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: _pName) String name,
  ) = _Unit;

  factory Unit.fromJson(Map<String, Object?> json) => _$UnitFromJson(json);

  Map<String, Object?> toJson() => {
    'id': id,
    _pName: name,
  };
}