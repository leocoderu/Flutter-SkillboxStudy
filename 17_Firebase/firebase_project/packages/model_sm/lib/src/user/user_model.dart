// Model of User

import 'package:flutter/material.dart';
/*import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel{
  const factory UserModel({
    bool auth,
    required String uid,
    String userName,
    String avatarUrl,
    String email,
  }) = _UserModel;
}

 */

class UserModel {
    String uid;
    String? userName;
    String? avatarUrl;
    String? email;
    bool? auth;

    UserModel(this.uid, {this.userName, this.avatarUrl, this.email, this.auth});
}