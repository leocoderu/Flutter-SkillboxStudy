import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';

class NotifierModel {
  int  timeout = 0;     // Timer value (0 - N)
  bool active = false;  // State timer, false - off / true - on

  NotifierModel();
}

class SwitchNotifier extends ChangeNotifier {

  Map<String, NotifierModel> data = {
    'switch1': NotifierModel(),
    'switch2': NotifierModel()
  };

  SwitchNotifier._();
  static final SwitchNotifier _switchNotifier = SwitchNotifier._();
  factory SwitchNotifier() => _switchNotifier;

  void start(String name, int time) {
    final timerPort = ReceivePort();
    if (data[name]!.active) return;
    data[name]!.timeout = time;
    data[name]!.active = true;
    Isolate.spawn(startTimer, (timeout: data[name]!.timeout, sendPort: timerPort.sendPort));
    _listener(name, timerPort);
    notifyListeners();
  }

  void _listener(String name, ReceivePort port) {
    port.listen((time) {
      if (time >= 0) {
        data[name]!.timeout = time;
        notifyListeners();
      } else {
        data[name]!.active = false;
        notifyListeners();
        port.close();
      }
    });
  }

  void stop(String name) async {
    data[name]!.timeout = 0;
    data[name]!.active = false;
    notifyListeners();
  }
}

void startTimer(({int timeout, SendPort sendPort}) data) async {
  for (int i = (data.timeout - 1); i >= -1; --i) {
    await Future.delayed(const Duration(seconds: 1), () => data.sendPort.send(i));
  }
}