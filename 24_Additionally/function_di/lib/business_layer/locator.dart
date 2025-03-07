import 'package:get_it/get_it.dart';

import '../data_layer/data_func.dart';
import 'func_controller.dart';

final locator = GetIt.instance;

Future<void> setupServices() async {
  locator
      ..registerSingleton<FuncController>(FuncController())
      ..registerSingleton<DataFunc>(DataFunc());
}