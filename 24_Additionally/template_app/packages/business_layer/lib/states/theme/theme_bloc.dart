// Import Dart
//import 'dart:ui';

// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:design_layer/design_layer.dart';

DefaultTheme getTheme(ThemeMode themeMode) {
  final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  switch (themeMode) {
    case ThemeMode.light:
      //ThemeData.light();
      return LightTheme();
    case ThemeMode.dark:
      //ThemeData.dark();
      return DarkTheme();
    // <- Type here another Theme
    default:
      if (brightness == Brightness.light) {
        //ThemeData.light();
        return LightTheme();
      }
      //ThemeData.dark();
      return DarkTheme();
      //return brightness == Brightness.light ? LightTheme() : DarkTheme();
  }
}

class ThemeBloc extends Bloc<ThemeState, DefaultTheme>{
   ThemeBloc() : super(getTheme(locator.get<ThemeController>().get())) {
    on<ChangeEvent>((event, Emitter<DefaultTheme> emit) {
      if (event.themeMode == null) {
        emit(getTheme(locator.get<ThemeController>().get()));
      } else {
        emit(getTheme(event.themeMode!));
        locator.get<ThemeController>().set(event.themeMode!);
        //event.id! == 1 ? ThemeData.light() : ThemeData.dark();
      }
    });
  }
}