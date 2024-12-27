abstract class AppState {}

class SetCounter extends AppState {
  final int? counter;
  SetCounter({this.counter});
}

class IncreaseCounter extends AppState {}

class DecreaseCounter extends AppState {}