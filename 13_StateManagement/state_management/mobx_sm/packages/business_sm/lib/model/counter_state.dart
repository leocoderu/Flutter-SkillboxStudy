import 'package:flutter/material.dart';

@immutable
class CounterState {
  final int value;

  CounterState({required this.value});

  factory CounterState.initial() => CounterState(value: 0);
  CounterState copyWith({int? value}) => CounterState(value: value ?? this.value);

  // Переопределяем для полноценной работы с объектом
  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is CounterState && runtimeType == other.runtimeType && value == other.value;
  @override
  int get hashCode => value.hashCode;
  @override
  String toString() => 'CounterState{value: $value}';
}