import 'package:flutter/material.dart';
import 'package:business_sm/model/counter_state.dart';

import 'package:business_sm/model/theme_state.dart';

@immutable
class AppState {
  final CounterState counterState;
  final ThemeState themeState;

  AppState({
    required this.counterState,
    required this.themeState
  });

  factory AppState.initial() {
    return AppState(
        counterState: CounterState.initial(),
        themeState: ThemeState.initial(),
    );
  }

  AppState copyWith({
    required CounterState? counterState,
    required ThemeState? themeState,
  }) {
      return AppState(
        counterState: counterState ?? this.counterState,
        themeState: themeState ?? this.themeState,
      );
  }

  // Переопределяем для полноценной работы с объектом
  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is AppState
          && counterState == other.counterState;
  //        && themeState == other.themeState;
  @override
  int get hashCode => counterState.hashCode;             // TODO: Add themeState
  @override
  String toString() => 'AppState{value: $counterState}'; // TODO: Add themeState
}
