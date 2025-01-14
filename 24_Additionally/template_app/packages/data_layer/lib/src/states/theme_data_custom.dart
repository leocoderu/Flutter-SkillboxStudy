// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:hive_flutter/hive_flutter.dart';

class ThemeDataCustom {
  static const String boxName = 'template_theme';
  static const String keyName = 'theme_mode';

  const ThemeDataCustom();

  ThemeMode _getThemeMode(int id) {
    switch (id) {
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  int _getID(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 1;
      case ThemeMode.dark:
        return 2;
      default:
        return 0;
    }
  }

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<int>(boxName);
  }

  ThemeMode get() {
    final box = Hive.box<int>(boxName);
    return _getThemeMode(box.get(keyName) ?? 0);
  }

  Future<void> set(ThemeMode value) async {
    final box = Hive.box<int>(boxName);
    return await box.put(keyName, _getID(value));
  }
}
