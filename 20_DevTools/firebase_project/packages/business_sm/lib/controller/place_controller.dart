// Import Layers
import 'package:business_sm/di/locator.dart';
import 'package:data_sm/data_sm.dart';
import 'package:model/model.dart';

class PlaceController {
  Future<List<Place>?> getPlaces() async => await locator.get<PlaceRepo>().getPlaces();
}