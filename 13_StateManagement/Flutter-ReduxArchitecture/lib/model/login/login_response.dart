import 'package:json_annotation/json_annotation.dart';
import 'package:reduxdemo/model/login/result.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String status;
  int code;
  String message;
  Result result;

  LoginResponse({
    this.status,
    this.code,
    this.message,
    this.result,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
