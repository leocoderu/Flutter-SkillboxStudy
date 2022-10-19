import 'package:json_annotation/json_annotation.dart';

part 'hotel_preview.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelPreview {
  String uuid, name, poster;

  HotelPreview({required this.uuid, required this.name, required this.poster});

  factory HotelPreview.fromJson(Map<String, dynamic> json) => _$HotelPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$HotelPreviewToJson(this);
}