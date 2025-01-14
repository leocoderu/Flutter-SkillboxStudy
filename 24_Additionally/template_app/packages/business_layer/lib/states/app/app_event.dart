abstract class AppEvent {}

class IncCounter extends AppEvent {}
class DecCounter extends AppEvent {}

class ChangeAuthLocal extends AppEvent {
  final bool value;
  ChangeAuthLocal({required this.value});
}

class ChangeAutoLogin extends AppEvent {
  final bool value;
  ChangeAutoLogin({required this.value});
}