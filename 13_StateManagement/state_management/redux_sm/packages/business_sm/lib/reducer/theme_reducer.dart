import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter/scheduler.dart';

import 'package:business_sm/model/theme_state.dart';
import 'package:business_sm/actions/theme_actions.dart';


ThemeData getSystem() =>
    (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) ? ThemeData.dark() : ThemeData.light();

final themeReducer = combineReducers<ThemeState>([
  TypedReducer<ThemeState, ChangeToLightAction>(_lightTheme),
  TypedReducer<ThemeState, ChangeToDarkAction>(_darkTheme),
  TypedReducer<ThemeState, ChangeToSystemAction>(_systemTheme),
]);

ThemeState _lightTheme(ThemeState state, ChangeToLightAction action) => state.copyWith(value: ThemeData.light());
ThemeState _darkTheme(ThemeState state, ChangeToDarkAction action) => state.copyWith(value: ThemeData.dark());
ThemeState _systemTheme(ThemeState state, ChangeToSystemAction action) => state.copyWith(value: ThemeData.fallback());//getSystem());