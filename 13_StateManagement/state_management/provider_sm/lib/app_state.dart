import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppState with ChangeNotifier {
  ThemeData currentTheme = (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) ? ThemeData.dark() : ThemeData.light();
  int counter = 0;

  void setTheme(ThemeData theme) {
    currentTheme = theme;
    notifyListeners();
  }

  void increment(){
    counter++;
    notifyListeners();
  }

  void decrement(){
    counter--;
    notifyListeners();
  }
}