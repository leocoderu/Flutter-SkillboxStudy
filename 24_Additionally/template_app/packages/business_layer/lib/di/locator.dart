import 'package:get_it/get_it.dart';

import 'package:business_layer/business_layer.dart';
import 'package:data_layer/data_layer.dart';

final locator = GetIt.instance;

Future<void> setupServices() async {
  locator
      ..registerSingleton<LocalPin>(LocalPin())
      ..registerSingleton<LocalPinController>(LocalPinController())

      ..registerSingleton<LocalAuthController>(LocalAuthController())
      ..registerSingleton<LocalAuth>(LocalAuth())

      ..registerSingleton<AppStateController>(AppStateController())
      ..registerSingleton<AppStateData>(AppStateData());

  locator.get<AppStateData>().init();
}