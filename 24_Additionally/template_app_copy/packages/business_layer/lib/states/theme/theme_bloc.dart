// Import Dart
import 'dart:ui';

// Import Packages
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:design_layer/design_layer.dart';

DefaultTheme getTheme(int id) {
  final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  switch (id) {
    case 1:
      //ThemeData.light();
      return LightTheme();
    case 2:
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
      if (event.id == null) {
        emit(getTheme(locator.get<ThemeController>().get()));
      } else {
        emit(getTheme(event.id!));
        locator.get<ThemeController>().set(event.id!);
        //event.id! == 1 ? ThemeData.light() : ThemeData.dark();
      }
    });
  }
}