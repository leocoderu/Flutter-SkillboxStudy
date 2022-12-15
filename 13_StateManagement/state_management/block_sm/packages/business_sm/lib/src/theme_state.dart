import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/scheduler.dart';

enum ThemeEvent { light, dark, system }

ThemeData getSystem() {
  return (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) ? ThemeData.dark() : ThemeData.light();
}

class ThemeBloc {
  ThemeData theme = getSystem();

  final _stateController = StreamController<ThemeData>();
  final _eventsController = StreamController<ThemeEvent>();

  Stream<ThemeData> get state => _stateController.stream;
  Sink<ThemeEvent> get action => _eventsController.sink;

  ThemeBloc(){
    _eventsController.stream.listen(_handleEvent);
  }

  void _handleEvent(ThemeEvent action) async {
    switch (action) {
      case ThemeEvent.light:
        theme = ThemeData.light();
        print('light');
        break;
      case ThemeEvent.dark:
        theme = ThemeData.dark();
        print('dark');
        break;
      case ThemeEvent.system:
        theme = getSystem();
        print('system');
        break;
      default:
        theme = getSystem();
        print('default');
        break;
    }
    _stateController.add(theme);
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }
}