import 'dart:ui';

import 'default_theme.dart';

class DarkTheme implements DefaultTheme {
  @override
  int id = 2;
  @override
  String? name = 'Dark Theme';

  @override
  Color? whiteColor = Color(0xFFFFFFFF);
  @override
  Color? blackColor = Color(0xFF000000);

  @override
  Color? mainColor500 = Color(0xFFA3B3EB);
  @override
  Color? mainColor400 = Color(0xFF859AE5);
  @override
  Color? mainColor300 = Color(0xFF6680DE);
  @override
  Color? mainColor200 = Color(0xFF5267B2);
  @override
  Color? mainColor100 = Color(0xFF3D4D85);
}