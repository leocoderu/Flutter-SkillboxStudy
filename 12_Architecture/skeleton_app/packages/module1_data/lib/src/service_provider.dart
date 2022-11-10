import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
//import 'package:module1_data/module1_data.dart';
//import 'package:module1_data/src/implementation/internals.dart';
import 'package:module1_data/src/service_provider.config.dart';
//import 'package:module1_data/src/internals.dart';

// class ServiceProvider {
//   static final _getIt = GetIt.I;
//
//   T get<T extends Object>() => _getIt.get<T>();
//
//   static final instance = ServiceProvider();
//
//   void initialize() {
//     _getIt.registerLazySingleton<HealthService>(() => DummyHealthService());
//     _getIt.registerLazySingleton<UserService>(() => DummyUserService());
//   }
// }

@InjectableInit()
void initializeServices() => $initGetIt(GetIt.I);
