import 'dart:ui';

import 'default_theme.dart';

class LimeTheme implements DefaultTheme{
  @override
  int id = 4;
  @override
  String? name = 'Lime Theme';

  @override
  Color? whiteColor = Color(0xFFFFFFFF);
  @override
  Color? blackColor = Color(0xFF000000);

  @override
  Color? mainColor100 = Color(0xFFB5DE66);
  @override
  Color? mainColor200 = Color(0xFF9DD333);
  @override
  Color? mainColor300 = Color(0xFF84C800);
  @override
  Color? mainColor400 = Color(0xFF6AA000);
  @override
  Color? mainColor500 = Color(0xFF4F7800);
}