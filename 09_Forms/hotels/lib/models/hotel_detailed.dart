import 'package:json_annotation/json_annotation.dart';

part 'hotel_detailed.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelDetailed {
  final String uuid, name, poster;
  final HotelAddress address;
  final double price, rating;
  final Services services;
  final List<String> photos;

  HotelDetailed({
    required this.uuid,
    required this.name,
    required this.poster,
    required this.address,
    required this.price,
    required this.rating,
    required this.services,
    required this.photos
  });

  factory HotelDetailed.fromJson(Map<String, dynamic> json) => _$HotelDetailedFromJson(json);
  Map<String, dynamic> toJson() => _$HotelDetailedToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelAddress{
  final String country;
  final String street;
  final String city;
  final String zip_code;
  final Coords coords;

  HotelAddress({
    required this.country,
    required this.street,
    required this.city,
    required this.zip_code,
    required this.coords
  });

  factory HotelAddress.fromJson(Map<String, dynamic> json) => _$HotelAddressFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressToJson(this);
}

@JsonSerializable()
class Coords{
  final double lat;
  final double lan;

  Coords({required this.lat, required this.lan});

  factory Coords.fromJson(Map<String, dynamic> json) => _$CoordsFromJson(json);
  Map<String, dynamic> toJson() => _$CoordsToJson(this);
}

@JsonSerializable()
class Services{
  final List<String> free;
  final List<String> paid;

  Services({required this.free, required this.paid});

  factory Services.fromJson(Map<String, dynamic> json) => _$ServicesFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}