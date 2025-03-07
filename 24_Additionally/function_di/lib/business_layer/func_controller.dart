import '../data_layer/data_func.dart';
import 'locator.dart';

class FuncController {
  //Future<void> runFunc() async => await locator.get<DataFunc>().runFunc();
  Future<void> runFunc() async => await heavyFunc([]);
}