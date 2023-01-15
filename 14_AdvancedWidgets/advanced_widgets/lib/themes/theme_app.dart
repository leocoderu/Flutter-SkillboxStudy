import 'package:flutter/material.dart';

class ThemeApp extends InheritedWidget {
  final ModelTheme theme;

  const ThemeApp({
    Key? key,
    required Widget child,
    required this.theme,
  }) : super(key: key, child: child);

  static ModelTheme of(BuildContext context) {
    final ThemeApp? result = context.dependOnInheritedWidgetOfExactType<ThemeApp>();
    assert(result != null, 'No ThemeApp found in context');
    return result!.theme;
  }

  @override
  bool updateShouldNotify(ThemeApp oldWidget) => false;
}

class ModelTheme {
  final Brightness brightness;
  final MaterialColor primary;

  ModelTheme({
    required this.brightness,
    required this.primary,
  });
}
