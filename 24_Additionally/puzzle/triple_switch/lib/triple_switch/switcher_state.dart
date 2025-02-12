import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';

class SwitchModel {
  int?  timeout;      // Timer value (0 - N), if
  Isolate? _isoTime;  // Isolate for Timer
  Isolate? _isoFunc;  // Isolate for Function
  dynamic result;     // Result of heavy function, null is doesn't have a result

  SwitchModel();      // Constructor
}

class SwitchState extends ChangeNotifier {

  Map<String, SwitchModel> data = {};

  // Initialize Singleton
  SwitchState._();
  static final SwitchState _switchState = SwitchState._();
  factory SwitchState() => _switchState;

  Future<void> start(String name, int? time, Function? function, List<dynamic>? arguments) async {
    final timerPort = ReceivePort();
    final funcPort = ReceivePort();

    //if (data[name]!.timeout != null) return;   // preventing a restart
    //stop(name);                       // stop isolate

    data[name]!.timeout = time;
    data[name]!.result = null;
    notifyListeners();

    data[name]!._isoTime = await Isolate.spawn(startTimer, (timeout: data[name]!.timeout!, sendPort: timerPort.sendPort));
    _listenTimer(name, timerPort);

    if (function != null) {
      data[name]!._isoFunc = await Isolate.spawn(_isoFunction, [funcPort.sendPort, function, arguments]);
      _listenFunc(name, funcPort);
    }
  }

  void _listenTimer(String name, ReceivePort port) {
    port.listen((time) {
      if (time < 0) {
        stop(name);
        //port.close(); /// TODO: Вероятно нужно поставить, протестить по возможности
        return;
      }

      data[name]!.timeout = time;
      notifyListeners();
    });
  }

  void _listenFunc(String name, ReceivePort port) {
    port.listen((res) {
      data[name]!.result = res.toString();
      notifyListeners();
      //port.close();
      stop(name);
    });
  }

  Future<void> stop(String name) async {
    if (data[name]!._isoTime == null) return;

    if (data[name]!._isoFunc != null) {
      data[name]!._isoFunc!.kill();
      data[name]!._isoFunc = null;
      data[name]!.result = null;
    }

    data[name]!._isoTime!.kill();
    data[name]!._isoTime = null;
    data[name]!.timeout = null;
    notifyListeners();
  }
}

Future<void> startTimer(({int timeout, SendPort sendPort}) data) async {
  for (int i = (data.timeout - 1); i >= -1; --i) {
    await Future.delayed(const Duration(seconds: 1), () => data.sendPort.send(i));
  }
}

Future<void> _isoFunction(List<dynamic> args) async {
  final SendPort sendPort = args[0];
  final Function func = args[1];
  final List<dynamic> arguments = args[2];

  final result = await func(arguments);
  sendPort.send(result);
}