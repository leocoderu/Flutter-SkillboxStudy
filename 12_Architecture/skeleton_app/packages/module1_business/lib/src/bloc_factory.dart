import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
//import 'package:module1_business/module1_business.dart';
import 'package:module1_business/src/bloc_factory.config.dart';
//import 'package:module1_business/src/main_health_bloc.dart';
import 'package:module1_data/module1_data.dart';

// class BlocFactory {
//   static final _getIt = GetIt.I;
//
//   T get<T extends Object>() => _getIt.get<T>();
//
//   static final instance = BlocFactory();
//
//   void initialize() {
//     ServiceProvider.instance.initialize();
//     _getIt.registerFactory<MainHealthBloc>(
//           () => MainHealthBloc(healthService: ServiceProvider.instance.get<HealthService>()),
//     );
//     _getIt.registerFactory<MainBloc>(
//         () => MainBloc(userService: ServiceProvider.instance.get<UserService>()),
//     );
//   }
// }

@InjectableInit()
void initializeBlocs(){
  initializeServices();
  $initGetIt(GetIt.I);
}