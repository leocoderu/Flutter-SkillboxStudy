import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:reduxdemo/core/constant/page_route_constants.dart';
import 'package:reduxdemo/core/constant/url_constant.dart';
import 'package:reduxdemo/model/login/login_request.dart';
import 'package:reduxdemo/model/login/login_response.dart';
import 'package:reduxdemo/network/app_client.dart';

ThunkAction loginUser(String email, String password, BuildContext context) {
  LoginRequest loginRequest = LoginRequest(email: email, password: password);
  return (Store store) async {
    new Future(() async {
      store.dispatch(new StartLoadingAction());
      AppClient().login(UrlConstant.LOGIN, loginRequest).then((loginResponse) {
        store.dispatch(new LoginSuccessAction(loginResponse));
        Navigator.of(context).pushReplacementNamed(
            PageRouteConstants.home_screen,
            arguments: loginResponse);
      }, onError: (error) {
        store.dispatch(new LoginFailedAction());
      });
    });
  };
}

class StartLoadingAction {
  StartLoadingAction();
}

class LoginSuccessAction {
  final LoginResponse loginResponse;

  LoginSuccessAction(this.loginResponse);
}

class LoginFailedAction {
  LoginFailedAction();
}
