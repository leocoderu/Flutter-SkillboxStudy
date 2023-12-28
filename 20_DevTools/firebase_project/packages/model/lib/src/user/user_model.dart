// Model of User
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel{
  const factory UserModel({
    required String uid,
    String? userName,
    String? avatarUrl,
    String? email,
    bool? auth,
  }) = _UserModel;
}
