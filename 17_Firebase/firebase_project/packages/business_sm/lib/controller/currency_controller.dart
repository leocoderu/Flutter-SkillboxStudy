// Import Layers
import 'package:business_sm/di/locator.dart';
import 'package:data_sm/data_sm.dart';
import 'package:model/model.dart';

class CurrencyController {
  Future<List<Currency>?> getCurrency() async => await locator.get<CurrencyRepo>().getCurrency();
}