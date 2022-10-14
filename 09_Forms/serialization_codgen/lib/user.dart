import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final int id;

  @JsonKey(defaultValue: 'Guest')
  final String name;

  @JsonKey(name: 'user_name')
  final String username;

  final String email;
  final UserAddress address;

  User({required this.id, required this.name, required this.username, required this.email, required this.address});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserAddress{
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  UserAddress({required this.street, required this.suite, required this.city, required this.zipcode});

  factory UserAddress.fromJson(Map<String, dynamic> json) => _$UserAddressFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressToJson(this);
}