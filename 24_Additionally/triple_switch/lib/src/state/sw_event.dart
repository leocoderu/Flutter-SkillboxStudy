import '../../triple_switch.dart';

abstract class SwEvent{}

class SetPosition extends SwEvent {
  SwitchPosition? switchPosition;
  SetPosition({this.switchPosition});
}

class SetPrevious extends SwEvent {
  SwitchPosition? previousPosition;
  SetPrevious({this.previousPosition});
}

class SetTimeout extends SwEvent {
  int? timeout;
  SetTimeout({this.timeout});
}


