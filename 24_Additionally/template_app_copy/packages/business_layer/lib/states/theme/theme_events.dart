import 'package:flutter/material.dart';

abstract class ThemeState {}

class ChangeEvent extends ThemeState {
    final ThemeMode? themeMode;
    ChangeEvent({this.themeMode});
}
