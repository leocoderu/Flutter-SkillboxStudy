import 'dart:ui';

import 'default_theme.dart';

class SantaTheme implements DefaultTheme{
  @override
  int id = 5;
  @override
  String? name = 'Santa Theme';

  @override
  Color? whiteColor = Color(0xFFFFFFFF);
  @override
  Color? blackColor = Color(0xFF000000);

  @override
  Color? mainColor100 = Color(0xFFEBDCA3);
  @override
  Color? mainColor200 = Color(0xFFE5D085);
  @override
  Color? mainColor300 = Color(0xFFDEC466);
  @override
  Color? mainColor400 = Color(0xFFB29D52);
  @override
  Color? mainColor500 = Color(0xFF85763D);
}