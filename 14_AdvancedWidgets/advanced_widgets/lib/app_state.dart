// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// // Global variables
// final countProvider = StateNotifierProvider<CountState, int>((_) => CountState());
// final themeProvider = StateNotifierProvider<ThemeState, ThemeData>((_) => ThemeState());
//
// class CountState extends StateNotifier<int> {
//   CountState() : super(0);
//
//   void increment() => state++;
//   void decrement() => state--;
// }
//
// class ThemeState extends StateNotifier<ThemeData> {
//   //ThemeData state = (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) ? ThemeData.dark() : ThemeData.light();
//   ThemeState() : super((SchedulerBinding.instance.window.platformBrightness == Brightness.dark) ? ThemeData.dark() : ThemeData.light());
//
//   void setTheme(ThemeData theme) => state = theme;
// }