// Import Packages
import 'package:hive_flutter/hive_flutter.dart';

// Import Layers
import 'package:model_layer/model_layer.dart';

class AppStateData {
  late Box<AppStateModel> appStateBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AppStateModelAdapter());
    appStateBox = await Hive.openBox<AppStateModel>('template_box');
  }

  Future<Box<AppStateModel>> init2() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AppStateModelAdapter());
    return await Hive.openBox<AppStateModel>('template_box');
  }

  //Get full state value from Hive
  Future<AppStateModel?> getAppState() async {
    Box<AppStateModel> box = await init2();
    return await box.get('template_box');
  }

  //Set full state value to Hive
  Future<void> setAppState(AppStateModel value) async {
    Box<AppStateModel> box = await init2();
    await box.put('template_box', value);
  }


  // Getter and Setter for LocalAuth
  Future<bool> getLocalAuth() async {
    //TODO: Get value from Hive
    return true;
  }

  Future<void> setLocalAuth(bool value) async {
    //TODO: Set value to Hive
  }

  // Getter and Setter for AutoLogin
  Future<bool> getAutoLogin() async {
    //TODO: Get value from Hive
    return true;
  }

  Future<void> setAutoLogin(bool value) async {
    //TODO: Set value to Hive
  }
}