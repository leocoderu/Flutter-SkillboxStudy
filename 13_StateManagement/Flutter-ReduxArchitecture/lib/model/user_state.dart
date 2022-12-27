import 'package:reduxdemo/model/login/login_response.dart';

import 'package:meta/meta.dart';

@immutable
class UserState {
  final bool isLoading;
  final bool loginError;

  final LoginResponse loginResponse;

  UserState({
    @required this.isLoading,
    @required this.loginError,
    @required this.loginResponse,
  });

  factory UserState.initial() {
    return new UserState(
        isLoading: false, loginError: false, loginResponse: null);
  }

  UserState copyWith(
      {bool isLoading, bool loginError, LoginResponse loginResponse}) {
    return new UserState(
        isLoading: isLoading ?? this.isLoading,
        loginError: loginError ?? this.loginError,
        loginResponse: loginResponse ?? this.loginResponse);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          loginError == other.loginError &&
          loginResponse == other.loginResponse;

  @override
  int get hashCode => isLoading.hashCode ^ loginResponse.hashCode;
}
