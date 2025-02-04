import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';

class SwitchModel {
  int  timeout = 0;     // Timer value (0 - N)
  bool active = false;  // State timer, false - off / true - on
  Isolate? isolate;     // Isolate for switchers work

  SwitchModel();      // Constructor
}

class SwitchState extends ChangeNotifier {

  Map<String, SwitchModel> data = {
    //'switch1': NotifierModel(),
    //'switch2': NotifierModel()
  };

  // Initialize Singleton
  SwitchState._();
  static final SwitchState _switchState = SwitchState._();
  factory SwitchState() => _switchState;

  Future<void> start(String name, int time) async {
    final timerPort = ReceivePort();
    if (data[name]!.active) return;   // preventing a restart

    stop(name);                       // stop isolate

    data[name]!.timeout = time;
    data[name]!.active = true;
    notifyListeners();

    // start isolate
    data[name]!.isolate = await Isolate.spawn(startTimer, (timeout: data[name]!.timeout, sendPort: timerPort.sendPort));
    _listener(name, timerPort);
  }

  void _listener(String name, ReceivePort port) {
    port.listen((time) {
      if (time < 0) {stop(name); return;}

      data[name]!.timeout = time;
      notifyListeners();
    });
  }

  Future<void> stop(String name) async {
    if (data[name]!.isolate == null) return;

    data[name]!.isolate!.kill();
    data[name]!.isolate = null;
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