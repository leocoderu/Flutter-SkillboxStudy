import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();

Color? frontColor = Colors.deepOrange[100];
Color? backColor = Colors.black54;

ThemeData themeLight = _themeLight.copyWith(
  appBarTheme: AppBarTheme(
    color: backColor,
    titleTextStyle: TextStyle(
      color: frontColor,
      fontSize: 16,
    ),
    actionsIconTheme: IconThemeData(color: frontColor),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: backColor,
  ),

  progressIndicatorTheme: ProgressIndicatorThemeData(color: backColor),

  colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: frontColor!,
      onPrimary: Colors.black12,
      secondary: Colors.green,
      onSecondary: Colors.lightGreen,
      error: Colors.red,
      onError: Colors.pinkAccent,
      background: Colors.purple,
      onBackground: Colors.purpleAccent,
      surface: Colors.yellow,
      onSurface: Colors.lightGreen,
  ),

  primaryColorDark: frontColor,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(frontColor),
      foregroundColor: MaterialStateProperty.all(Colors.black),
    ),
  ),

  cardTheme: CardTheme(
    color: frontColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    clipBehavior: Clip.antiAlias,
  ),

  chipTheme: ChipThemeData(
    selectedColor: frontColor,
    disabledColor: Colors.grey,
    backgroundColor: backColor,
    showCheckmark: false,
    labelStyle: const TextStyle(color: Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    )
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.grey,
  ),
  textTheme: _textLight(_themeLight.textTheme),
);

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    headlineMedium: base.headlineMedium!.copyWith(
      fontSize: 20,
    ),
  );
}
