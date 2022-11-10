import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:module1_data/src/service_provider.config.dart';


@InjectableInit()
void initializeServices() => $initGetIt(GetIt.I);
