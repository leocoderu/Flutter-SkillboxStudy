// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:data_layer/data_layer.dart';

class ThemeController {
  Future<void> init() async => await locator.get<ThemeData>().init();

  int get() => locator.get<ThemeData>().get();

  Future<void> set(int value) async => await locator.get<ThemeData>().set(value);

//Future<void> inc() async => locator.get<CounterData>().inc();
//Future<void> dec() async => locator.get<CounterData>().dec();
}