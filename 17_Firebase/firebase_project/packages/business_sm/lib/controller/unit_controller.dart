// Import Layers
import 'package:business_sm/di/locator.dart';
import 'package:data_sm/data_sm.dart';
import 'package:model/model.dart';

class UnitController {
  Future<List<Unit>?> getUnits() async => await locator.get<UnitRepo>().getUnits();
}