import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CupertinoThemeData _cupertinoBase = const CupertinoThemeData();

final CupertinoThemeData cupertinoLightTheme = _cupertinoBase.copyWith(
  scaffoldBackgroundColor: Colors.cyan,
  textTheme: _cupertinoBase.textTheme.copyWith(
      textStyle: const TextStyle(
          color: Colors.red,
          fontSize: 20
      ),
  ),
);

final CupertinoThemeData cupertinoDarkTheme = _cupertinoBase.copyWith(
  scaffoldBackgroundColor: Colors.brown,
  barBackgroundColor: CupertinoColors.activeGreen,
);