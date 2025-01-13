// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:design_layer/design_layer.dart';

DefaultTheme getThemeInit(ThemeMode themeMode) {
  final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  switch (themeMode) {
    case ThemeMode.light:
      return LightTheme();
    case ThemeMode.dark:
      return DarkTheme();
    default:
      return brightness == Brightness.light ? LightTheme() : DarkTheme();
  }
}

class ThemeBloc extends Bloc<ThemeEvent, DefaultTheme> {
  ThemeBloc() : super(getThemeInit(locator.get<ThemeController>().get())) {
    on<ChangeEvent>((event, Emitter<DefaultTheme> emit) {
      if (event.themeMode == null) {
        emit(getThemeInit(locator.get<ThemeController>().get()));
      } else {
        emit(getThemeInit(event.themeMode!));
        locator.get<ThemeController>().set(event.themeMode!);
      }
    });
  }
}