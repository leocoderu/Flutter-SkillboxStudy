import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobx/mobx.dart';

part 'app_state.g.dart';

ThemeData getSystem() =>
    (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) ? ThemeData.dark() : ThemeData.light();

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {

  @observable
  int value = 0;

  @observable
  ThemeData theme = getSystem();

  @observable
  bool isLoaded = false;

  @action
  void increment() => value++;

  @action
  void decrement() => value--;

  @action
  void changeTheme(ThemeData themeData) => theme = themeData;

  @action
  void changeLoading(){
    isLoaded = !isLoaded;
  }
}