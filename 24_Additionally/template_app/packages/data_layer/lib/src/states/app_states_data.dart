// Import Packages
import 'package:hive_flutter/hive_flutter.dart';

// Import Layers
import 'package:model_layer/model_layer.dart';

class AppStateData {
  static const String boxName = 'template_box';
  static const String keyThemeMode = 'theme_mode';
  static const String keyCounter = 'counter';
  static const String keyAuthLocal = 'auth_local';
  static const String keyAutoLogin = 'auto_login';
  static const String keySwitcher = 'switcher';
  static const String keyText = 'text';

  AppStateData();

  late Box<AppState> boxApp;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AppStateAdapter());
    //boxApp =
    //await Hive.openBox<AppState>(boxName);
    await Hive.openBox<AppState>(boxName);
  }

  // Synchro initialize BloC
  AppState getAppState() {
    boxApp = Hive.box<AppState>(boxName);
    final AppState? appState  = boxApp.get('keyCounter');
    print('appState: $appState');
    //final boxInt = Hive.box<int>(boxName);
    // final boxBool = Hive.box<bool>(boxName);
    // final boxString = Hive.box<String>(boxName);

    //final bool authLocal = boxApp.get(keyAuthLocal) as bool? ?? false;
    //final bool autoLogin = boxApp.get(keyAutoLogin) as bool? ?? false;
    //final int  counter   = boxInt.get(keyCounter) ?? 0;
   // final bool switcher  = boxApp.get(keySwitcher) as bool? ?? false;
    //final String text    = boxApp.get(keyText) as String? ?? '';

    //final bool authLocal = boxBool.get(keyAuthLocal) ?? false;
    //final bool autoLogin = boxBool.get(keyAutoLogin) ?? false;
    //final int counter    = boxInt.get(keyCounter) ?? 0;
    //final bool switcher  = boxBool.get(keySwitcher) ?? false;
    //final String text    = boxString.get(keyText) ?? '';

    return AppState(
      auth_local: false, //authLocal,
      auto_login: false, //autoLogin,
      counter: (appState != null) ? appState.counter : 0, //counter,
      switcher: false, //switcher,
      text: '', //text,
    );
  }

  // //Get Theme Mode state value from Hive
  // Future<ThemeMode> getThemeMode() async {
  //   final box = Hive.box<ThemeMode>(boxName);
  //   return await box.get(keyThemeMode) ?? ThemeMode.system;
  // }
  //Get Theme Mode ID state value from Hive
  // Future<int> getThemeModeID() async {
  //   final box = Hive.box<int>(boxName);
  //   return await box.get(keyThemeMode) ?? 0;
  // }
  //Set Theme Mode state value to Hive
  // Future<void> setThemeMode(ThemeMode value) async {
  //   final box = Hive.box<ThemeMode>(boxName);
  //   return await box.put(keyThemeMode, value);
  // }

  //Get Auth Local state value from Hive
  Future<bool> getAuthLocal() async {
    final box = Hive.box<bool>(boxName);
    return await box.get(keyAuthLocal) ?? false;
  }
  //Set Auth Local state value to Hive
  Future<void> setAuthLocal(bool value) async {
    final box = Hive.box<bool>(boxName);
    return await box.put(keyAuthLocal, value);
  }

  //Get Auto Login state value from Hive
  Future<bool> getAutoLogin() async {
    final box = Hive.box<bool>(boxName);
    return await box.get(keyAutoLogin) ?? false;
  }
  //Set Auto Login state value to Hive
  Future<void> setAutoLogin(bool value) async {
    final box = Hive.box<bool>(boxName);
    return await box.put(keyAutoLogin, value);
  }

  //Get Counter state value from Hive
  Future<int> getCounter() async {
    //AppState? app = boxApp.get(keyCounter);
    //return (app != null) ? (await boxApp.get(keyCounter)!.counter ?? 0) : 0;
    final box = Hive.box<int?>(boxName);
    return await box.get(keySwitcher) ?? 0;
  }
  //Set Counter state value to Hive
  Future<void> setCounter(int value) async {
    //AppState? app = boxApp.get(keyCounter);
    //app = (app != null) ? app.copyWith(counter: value) : AppState(counter: value);
    //return await boxApp.put(keyCounter, app);
    final box = Hive.box<int>(boxName);
    return await box.put(keyCounter, value);
  }

  //Get Switcher state value from Hive
  Future<bool> getSwitcher() async {
    final box = Hive.box<bool>(boxName);
    return await box.get(keySwitcher) ?? false;
    //return await boxApp.get(keySwitcher) as bool? ?? false;
  }
  //Set Switcher state value to Hive
  Future<void> setSwitcher(bool value) async {
    final box = Hive.box<bool>(boxName);
    return await box.put(keySwitcher, value);
  }

  //Get Text state value from Hive
  Future<String> getText() async {
    final box = Hive.box<String>(boxName);
    return await box.get(keyText) ?? '';
  }
  //Set Text state value to Hive
  Future<void> setText(String value) async {
    final box = Hive.box<String>(boxName);
    return await box.put(keyText, value);
  }
}