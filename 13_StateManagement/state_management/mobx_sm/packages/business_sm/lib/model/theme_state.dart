import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

ThemeData getSystem() =>
    (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) ? ThemeData.dark() : ThemeData.light();
    // MediaQuery.of(context).platformBrightness  need context!!!
@immutable
class ThemeState {
  late final ThemeData value;

  ThemeState({required this.value});

  factory ThemeState.initial() => ThemeState(value: ThemeData.light()); // TODO: <- getSystem());
  ThemeState copyWith({ThemeData? value}) => ThemeState(value: value ?? this.value);

  // Переопределяем для полноценной работы с объектом
  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is ThemeState && runtimeType == other.runtimeType && value == other.value;
  @override
  int get hashCode => value.hashCode;
  @override
  String toString() => 'ThemeState{value: $value}';
}