import 'package:business_layer/di/locator.dart';
import 'package:data_layer/data_layer.dart';
import 'package:model_layer/model_layer.dart';

class AppStateController {
  Future<AppStateModel?> getState() async =>
      await locator.get<AppStateData>().getAppState();

  Future<void> setState(AppStateModel value) async =>
      await locator.get<AppStateData>().setAppState(value);

  Future<bool> getLocalAuthState() async =>
      await locator.get<AppStateData>().getLocalAuth();

  Future<void> setLocalAuthState(bool value) async =>
      await locator.get<AppStateData>().setLocalAuth(value);

  Future<bool> getAutoLoginState() async =>
      await locator.get<AppStateData>().getAutoLogin();

  Future<void> setAutoLoginState(bool value) async =>
      await locator.get<AppStateData>().setAutoLogin(value);
}