// Import Packages
import 'package:hive_flutter/hive_flutter.dart';

class ThemeData {
  static String boxName = 'template_app';
  static String keyName = 'theme_id';

  const ThemeData();

  Future<void> init() async {
    if(!Hive.isBoxOpen(boxName)) {
      await Hive.initFlutter();
      await Hive.openBox<int>(boxName);
    }
  }

  int get() {
    final box = Hive.box<int>(boxName);
    return box.get(keyName) ?? 0;
  }

  Future<void> set(int value) async {
    final box = Hive.box<int>(boxName);
    return await box.put(keyName, value);
  }
}
