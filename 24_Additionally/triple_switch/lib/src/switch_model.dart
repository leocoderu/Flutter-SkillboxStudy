import '../triple_switch.dart';

class SwitchModel {
  SwitchPosition? position;
  SwitchPosition? previous;
  int? timeout;

  SwitchModel({this.position, this.previous, this.timeout});

  SwitchModel copyWith({SwitchPosition? position, SwitchPosition? previous, int? timeout}) =>
    SwitchModel(
      position: position ?? this.position,
      previous: previous ?? this.previous,
      timeout: timeout ?? this.timeout,
    );
}