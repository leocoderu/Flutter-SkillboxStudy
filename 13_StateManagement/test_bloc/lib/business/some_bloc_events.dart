abstract class SomeEvent {}

// Event for change First state
class ChangeFirst extends SomeEvent {
  final double value;
  ChangeFirst({required this.value});
}

// Event for change Text state
class ChangeText extends SomeEvent {
  final String value;
  ChangeText({required this.value});
}

// Event for change Count state
class ChangeCount extends SomeEvent {
  final int value;
  ChangeCount({required this.value});
}

// Event for change Full List state
class ChangeList extends SomeEvent {
  final List<String> value;
  ChangeList({required this.value});
}

// Event for adding Value to List state
class AddToList extends SomeEvent {
  final String value;
  AddToList({required this.value});
}

// Event for adding Value to List state
class ClearList extends SomeEvent {
  ClearList();
}


