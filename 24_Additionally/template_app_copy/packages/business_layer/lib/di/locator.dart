// Import Packages
import 'package:get_it/get_it.dart';

// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:data_layer/data_layer.dart';

final locator = GetIt.instance;

Future<void> setupServices() async {
  await locator
      ..registerSingleton<LocalPin>(LocalPin())
      ..registerSingleton<LocalPinController>(LocalPinController())

      ..registerSingleton<LocalAuthController>(LocalAuthController())
      ..registerSingleton<LocalAuth>(LocalAuth())

      ..registerSingleton<AppStateController>(AppStateController())
      ..registerSingleton<AppStateData>(AppStateData())

      ..registerSingleton<CounterController>(CounterController())
      ..registerSingleton<CounterData>(CounterData())

      ..registerSingleton<ThemeController>(ThemeController())
      ..registerSingleton<ThemeData>(ThemeData());

  await locator.get<CounterController>().init(); // Hive initialization
}