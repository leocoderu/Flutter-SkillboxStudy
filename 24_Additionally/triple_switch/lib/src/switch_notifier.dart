import 'package:flutter/material.dart';

import 'triple_switch.dart';

class SwitchNotifier extends ChangeNotifier{
  SwitchPosition? position; // TODO: May be bool and haven't null, only True or False
  int? timeout;             // TODO: if timer has positive value and zero, state Wait, or position

  SwitchNotifier({this.position, this.timeout});

  SwitchNotifier copyWith({SwitchPosition? position, int? timeout}) =>
    SwitchNotifier(
      position: position ?? this.position,
      timeout: timeout ?? this.timeout,
    );

  SwitchPosition? getPosition() => position;
  void setPosition(SwitchPosition? swp) {
    position = swp;
    notifyListeners();
  }

  int? getTimeout() => timeout;
  void setTimeout(int? time) {
    timeout = time;
    notifyListeners();
  }
}