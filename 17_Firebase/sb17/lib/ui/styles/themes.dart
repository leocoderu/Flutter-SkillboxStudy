// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final defaultTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.green,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
  primaryColor: Colors.white,
  primarySwatch: Colors.green,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

const signinSystemOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.white,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.dark,
);
