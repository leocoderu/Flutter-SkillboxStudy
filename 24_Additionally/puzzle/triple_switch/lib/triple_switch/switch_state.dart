import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';

class SwitchModel {
  bool position;      // Position of switch, true - On / false - Off
  int?  timeout;      // Timer value (0 - N), null is timer off
  Isolate? _isoTime;  // Isolate for Timer
  Isolate? _isoFunc;  // Isolate for Function
  dynamic result;     // Result value of heavy function, null is doesn't have a result
  bool?  success;     // Result state, null is doesn't have a result, true - success / false - error

  SwitchModel(this.position);      // Default Constructor
}

class SwitchState extends ChangeNotifier {

  Map<String, SwitchModel> data = {};

  // Initialize Singleton
  SwitchState._();
  static final SwitchState _switchState = SwitchState._();
  factory SwitchState() => _switchState;

  Future<void> start(String name, int? time, Function? function, List<dynamic>? arguments) async {

    if (time == null) {
      data[name]!.result  = null;
      data[name]!.success = null;
      data[name]!.position = !data[name]!.position;
      notifyListeners();
      return;
    }

    final timerPort = ReceivePort();
    final funcPort  = ReceivePort();

    //if (data[name]!.timeout != null) return;   // preventing a restart
    //stop(name);                       // stop isolate

    data[name]!.timeout = time;
    data[name]!.result  = null;
    data[name]!.success = null;
    notifyListeners();

    data[name]!._isoTime = await Isolate.spawn(_isoTimer, [timerPort.sendPort, data[name]!.timeout!]);
    _listenTimer(name, timerPort, funcPort);

    if (function != null) {
      data[name]!._isoFunc = await Isolate.spawn(_isoFunction, [funcPort.sendPort, function, arguments ?? []]);
      _listenFunc(name, funcPort, timerPort);
    }
  }

  void _listenTimer(String name, ReceivePort portTimer, ReceivePort portFunc) {
    portTimer.listen((time) {
      if (time == null) {
        portTimer.close();
        portFunc.close();

        stop(name);
        return;
      }

      data[name]!.timeout = time;
      notifyListeners();
    });
  }

  void _listenFunc(String name, ReceivePort portFunc, ReceivePort portTimer) {
    portFunc.listen((res) {
      data[name]!.result = res[0];
      data[name]!.success = res[1];
      data[name]!.position = res[1] ? !data[name]!.position : data[name]!.position;

      notifyListeners();

      portFunc.close();
      portTimer.close();

      stop(name);
    });
  }

  Future<void> stop(String name) async {
    if (data[name]!._isoTime == null) return;

    if (data[name]!._isoFunc != null) {
      data[name]!._isoFunc!.kill();
      data[name]!._isoFunc = null;
      //data[name]!.result = null;
      //data[name]!.success = null;
    }

    data[name]!._isoTime!.kill();
    data[name]!._isoTime = null;
    data[name]!.timeout = null;
    notifyListeners();
  }

  static Future<void> _isoTimer(List<dynamic> data) async {
    final SendPort sendPort = data[0];
    final int timeout = data[1];

    for (int i = (timeout - 1); i >= 0; --i) {
      await Future.delayed(const Duration(seconds: 1), () => sendPort.send(i));
    }
    sendPort.send(null);
  }

  static Future<void> _isoFunction(List<dynamic> args) async {
    final SendPort sendPort = args[0];
    final Function func = args[1];
    final List<dynamic> arguments = args[2];

    final result = await func(arguments);
    sendPort.send(result);
  }
}

