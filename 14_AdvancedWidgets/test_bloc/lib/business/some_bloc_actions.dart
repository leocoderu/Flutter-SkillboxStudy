abstract class SomeEvent {}

// Action for change First state
class ChangeFirst extends SomeEvent {
  final double value;
  ChangeFirst({required this.value});
}

// Action for change Text state
class ChangeText extends SomeEvent {
  final String value;
  ChangeText({required this.value});
}

// Action for change Count state
class ChangeCount extends SomeEvent {
  final int value;
  ChangeCount({required this.value});
}
