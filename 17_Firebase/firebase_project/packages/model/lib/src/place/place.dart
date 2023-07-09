// Model of Place
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

const _pID = 'id';             // Numeric    ID
const _pName = 'name';         // String     Что:     Рынок/Магазин/Супермаркет

@freezed
class Place with _$Place{

  const factory Place(
    @JsonKey(name: _pID) int id,
    @JsonKey(name: _pName) String name,
  ) = _Place;

  factory Place.fromJson(Map<String, Object?> json) => _$PlaceFromJson(json);

  Map<String, Object?> toJson() => {
    _pID: id,
    _pName: name,
  };
}