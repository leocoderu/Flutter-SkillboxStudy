import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  String accessToken;
  String tokenType;
  int expiresIn;
  Data data;

  Result({this.accessToken, this.tokenType, this.expiresIn, this.data});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
