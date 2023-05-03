import 'package:get_it/get_it.dart';

import 'package:business/src/person_controller.dart';
import 'package:data/data.dart';

// TODO 2: Create a get_it locator
final locator = GetIt.instance;

// TODO 3: Create a setup method and create our services
void setup(){
  locator.registerLazySingleton<PersonRepo>(() => PersonRepo());
  locator.registerLazySingleton<PersonController>(() => PersonController());
}