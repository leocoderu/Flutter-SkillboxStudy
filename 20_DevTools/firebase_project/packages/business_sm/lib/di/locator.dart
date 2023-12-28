import 'package:get_it/get_it.dart';

import 'package:data_sm/data_sm.dart';
import 'package:business_sm/business_sm.dart';
//import 'package:model/model.dart';

final locator = GetIt.instance;

void setupServices() async {
  locator.registerSingleton<AuthRepo>(AuthRepo());
  locator.registerSingleton<AuthController>(AuthController());

  locator.registerSingleton<ProductRepo>(ProductRepo());
  locator.registerSingleton<ProdController>(ProdController());

  locator.registerSingleton<PlaceRepo>(PlaceRepo());
  locator.registerSingleton<PlaceController>(PlaceController());

  locator.registerSingleton<CurrencyRepo>(CurrencyRepo());
  locator.registerSingleton<CurrencyController>(CurrencyController());

  locator.registerSingleton<UnitRepo>(UnitRepo());
  locator.registerSingleton<UnitController>(UnitController());

  //await Hive.initFlutter();
  //await Hive.openBox<AppStateModel>('store_box'); //WARNING!!!: May be isn't necessary type AppStateModel
}