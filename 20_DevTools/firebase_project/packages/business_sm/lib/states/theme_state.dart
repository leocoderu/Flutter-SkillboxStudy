import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeEvent { light, dark, system, green, red }

ThemeData getSystem() {
  // ignore: deprecated_member_use
  return (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) ? ThemeData.dark() : ThemeData.light();
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeData>{
  ThemeBloc(): super(getSystem()) {
    on<ThemeEvent>((event, emit) {
      switch (event) {
        case ThemeEvent.light:  emit(ThemeData.light());
        break;
        case ThemeEvent.dark:   emit(ThemeData.dark());
        break;
        case ThemeEvent.green:  emit(greenTheme());
        break;
        case ThemeEvent.red: emit(redTheme());
        break;
        case ThemeEvent.system: emit(getSystem());
        break;
        default: emit(getSystem());
        break;
      }
    });
  }
}

ThemeData greenTheme() => ThemeData(primarySwatch: Colors.green);
ThemeData redTheme() => ThemeData(primarySwatch: Colors.red);