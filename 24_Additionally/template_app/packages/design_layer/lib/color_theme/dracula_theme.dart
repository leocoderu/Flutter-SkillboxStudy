import 'dart:ui';

import 'default_theme.dart';

class DraculaTheme implements DefaultTheme{
  @override
  int id = 3;
  @override
  String? name = 'Dracula Theme';

  @override
  Color? whiteColor = Color(0xFFFFFFFF);
  @override
  Color? blackColor = Color(0xFF000000);

  @override
  Color? mainColor100 = Color(0xFFDF7D77);
  @override
  Color? mainColor200 = Color(0xFFD5524A);
  @override
  Color? mainColor300 = Color(0xFFCA271D);
  @override
  Color? mainColor400 = Color(0xFFA11F17);
  @override
  Color? mainColor500 = Color(0xFF791711);
}