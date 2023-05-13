import 'package:get_it/get_it.dart';

import 'package:data_sm/data_sm.dart';
import 'package:business_sm/controller/auth_controller.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<AuthRepo>(AuthRepo());
  locator.registerSingleton<AuthController>(AuthController());
}