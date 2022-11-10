import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:module1_business/src/bloc_factory.config.dart';
import 'package:module1_data/module1_data.dart';

@InjectableInit()
void initializeBlocs(){
  initializeServices();
  $initGetIt(GetIt.I);
}