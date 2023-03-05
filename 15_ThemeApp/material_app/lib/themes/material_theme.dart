import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();
ThemeData _themeDark = ThemeData.dark();

ThemeData themeLight = _themeLight.copyWith(
  appBarTheme: const AppBarTheme(color: Colors.purple,),
  textTheme: _textLight(_themeLight.textTheme),
);

ThemeData themeDark = _themeDark.copyWith(
  appBarTheme: const AppBarTheme(color: Colors.yellow,),
  textTheme: _textDark(_themeDark.textTheme),
);

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    bodyLarge: base.bodyLarge!.copyWith(
        color: Colors.cyan
    ),
    bodyMedium: base.bodyMedium!.copyWith(
        color: Colors.indigo
    ),
  );
}

TextTheme _textDark(TextTheme base) {
  return base.copyWith(
    bodyLarge: base.bodyLarge!.copyWith(
        color: Colors.deepOrange
    ),
    bodyMedium: base.bodyMedium!.copyWith(
        color: Colors.deepOrange
    ),
  );
}