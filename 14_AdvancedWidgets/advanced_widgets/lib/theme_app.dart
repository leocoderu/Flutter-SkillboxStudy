import 'package:flutter/material.dart';

class ThemeApp extends InheritedWidget {
  const ThemeApp({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static ThemeApp of(BuildContext context) {
    final ThemeApp? result = context.dependOnInheritedWidgetOfExactType<ThemeApp>();
    assert(result != null, 'No ThemeApp found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeApp old) {
    return false;
  }
}
