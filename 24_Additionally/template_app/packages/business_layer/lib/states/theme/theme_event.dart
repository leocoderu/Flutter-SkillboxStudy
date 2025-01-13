// Import Flutter
import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class ChangeEvent extends ThemeEvent {
    final ThemeMode? themeMode;
    ChangeEvent({this.themeMode});
}
