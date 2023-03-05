import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_app/themes/cupertino_theme.dart';
import 'package:material_app/themes/material_theme.dart';

enum CustomBrightness {light, dark}

class ThemeProvider extends ChangeNotifier{
  ThemeData _currentTheme = themeLight;
  CustomBrightness _brightness = CustomBrightness.light;

  ThemeData get current => _currentTheme;
  CustomBrightness get brightness => _brightness;

  toggle(CustomBrightness brightness) {
    if (brightness == CustomBrightness.dark) {
      _brightness = CustomBrightness.dark;
      _currentTheme = themeDark;
    } else {
      _brightness = CustomBrightness.light;
      _currentTheme = themeLight;
    }
    notifyListeners();
  }
}

class ThemeProviderCupertino extends ChangeNotifier{
  CupertinoThemeData _current = cupertinoLightTheme;
  CustomBrightness _brightness = CustomBrightness.light;

  CupertinoThemeData get current => _current;
  CustomBrightness get brightness => _brightness;

  toggle(CustomBrightness brightness){
    if (brightness == CustomBrightness.dark) {
      _brightness = CustomBrightness.dark;
      _current = cupertinoDarkTheme;
    } else {
      _brightness = CustomBrightness.light;
      _current = cupertinoLightTheme;
    }
    notifyListeners();
  }
}

class CommonThemeProvider extends ChangeNotifier {
  CustomBrightness _brightness = CustomBrightness.light;
  ThemeData _materialTheme = themeLight;
  CupertinoThemeData _cupertinoTheme = cupertinoLightTheme;

  CustomBrightness get brightness => _brightness;
  ThemeData get currentMaterial => _materialTheme;
  CupertinoThemeData get currentCupertino => _cupertinoTheme;


  toggle(CustomBrightness brightness){
    _brightness = brightness;

    if (brightness == CustomBrightness.dark) {
      _materialTheme = themeDark;
      _cupertinoTheme = cupertinoDarkTheme;
    } else {
      _materialTheme = themeLight;
      _cupertinoTheme = cupertinoLightTheme;
    }

    notifyListeners();
  }
}