import 'package:model_layer/model_layer.dart';

abstract class AppState {}

class SetCounter extends AppState {
  final int? counter;
  SetCounter({this.counter});
}

class IncreaseCounter extends AppState {
  final int? counter;
  IncreaseCounter({this.counter});
}

