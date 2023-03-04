import 'package:flutter/material.dart';

class ThemeText extends InheritedWidget {
  final CustomTextTheme theme;

  const ThemeText({
    Key? key,
    required Widget child,
    required this.theme,
  }) : super(key: key, child: child);

  static CustomTextTheme of(BuildContext context) {
    final ThemeText? result = context.dependOnInheritedWidgetOfExactType<ThemeText>();
    assert(result != null, 'No ThemeApp found in context');
    return result!.theme;
  }

  @override
  bool updateShouldNotify(ThemeText oldWidget) => theme != oldWidget.theme;
}

class CustomTextTheme {
  final double fontSize;
  final Color textColor;
  FontWeight fontWeight;

  CustomTextTheme({
    required this.fontSize,
    required this.textColor,
    required this.fontWeight,
  });
}