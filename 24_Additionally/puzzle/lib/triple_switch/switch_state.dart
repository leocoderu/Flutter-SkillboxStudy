import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';

class SwitchModel {
  bool position;              /// Position of switch, true - On / false - Off
  int?  timeout;              /// Timer value (0 - N), null is timer off
  Isolate? _isoTime;          /// Isolate for Timer
  Isolate? _isoFunc;          /// Isolate for Function
  dynamic result;             /// Result value of heavy function, null is doesn't have a result
  bool?  success;             /// Result state, null is doesn't have a result, true - success / false - error
  Function(bool)? saveFunc;   /// Function for save result

  SwitchModel({this.position = false, this.saveFunc});  /// Default Constructor
}

class SwitchState extends ChangeNotifier {

  /// Base of switches
  Map<String, SwitchModel> data = {};

  /// Initialize Singleton
  SwitchState._();
  static final SwitchState _switchState = SwitchState._();
  factory SwitchState() => _switchState;

  /// Start function
  Future<void> start(String name, int? time, Function? function, List<dynamic>? arguments) async {

    /// If timer is null, then timeout is null
    if (time == null) {                               /// If timer is null, then timeout is null
      data[name]!.result  = null;                     /// Unknown result
      data[name]!.success = null;                     /// The result successfully unknown
      data[name]!.position = !data[name]!.position;   /// Inverse switch position
      if (data[name]!.saveFunc != null) {             /// If save function exists
        data[name]!.saveFunc!(data[name]!.position);  /// Send result to save function
      }
      notifyListeners();                              /// Notify listeners
      return;
    }

    final timerPort = ReceivePort();                  /// Open listener port
    final funcPort  = ReceivePort();                  /// Open listener port

    data[name]!.timeout = time;                       /// Set timeout
    data[name]!.result  = null;                       /// Drop the previous result
    data[name]!.success = null;                       /// Drop the previous success result
    data[name]!._isoTime = null;
    data[name]!._isoFunc = null;
    notifyListeners();                                /// Notify listeners TODO: Может быть избыточное уведомление, т.к. оно происходит в _listenTimer

    /// Start isolate for timer
    data[name]!._isoTime = await Isolate.spawn(_isoTimer, [timerPort.sendPort, data[name]!.timeout!]);
    _listenTimer(name, timerPort, funcPort);          /// Start listen timer port

    /// If heavy function exists, start heavy function in isolate
    if (function != null) {
      data[name]!._isoFunc = await Isolate.spawn(_isoFunction, [funcPort.sendPort, function, arguments ?? []]);
      _listenFunc(name, funcPort, timerPort);         /// Start listen heavy function port
    }
  }

  /// Listener for Timer port
  void _listenTimer(String name, ReceivePort portTimer, ReceivePort portFunc) {
    portTimer.listen((time) {
      if (time == null) {     /// If Timer was complete
        portTimer.close();    /// Stop Listener
        portFunc.close();     /// Stop Listener

        stop(name);           /// Stop Isolate
        return;
      }

      data[name]!.timeout = time; /// Set new value of Timer
      notifyListeners();          /// Notify Listeners
    });
  }

  /// Listener for heavy function port
  void _listenFunc(String name, ReceivePort portFunc, ReceivePort portTimer) {
    portFunc.listen((res) {             /// If result of heavy function was received
      data[name]!.result = res[0];      /// Result of heavy function
      data[name]!.success = res[1];     /// The result of successful operation
      data[name]!.position = res[1] ? !data[name]!.position : data[name]!.position; /// Change switch position
      if (data[name]!.saveFunc != null) {             /// If save function exists
        data[name]!.saveFunc!(data[name]!.position);  /// Send position to save function
      }
      notifyListeners();      /// Notify Listeners TODO: Может быть это не нужно!!! Уведомление слушателей происходит в ф-ции stop

      portFunc.close();       /// Stop Listener
      portTimer.close();      /// Stop Listener

      stop(name);             /// Stop Isolate
    });
  }

  /// Stop isolate
  Future<void> stop(String name) async {
    if (data[name]!._isoTime == null) return;     /// If the isolation timer is not started, stop nothing.

    /// If heavy function isolate exists, kill him
    if (data[name]!._isoFunc != null) {
      data[name]!._isoFunc!.kill();
      data[name]!._isoFunc = null;
    }

    /// Kill timer isolate
    data[name]!._isoTime!.kill();
    data[name]!._isoTime = null;
    data[name]!.timeout = null;     /// Set timeout as null
    notifyListeners();              /// Notify Listeners
  }

  /// Isolate function for Timer
  static Future<void> _isoTimer(List<dynamic> data) async {
    final SendPort sendPort = data[0];          /// First argument is port
    final int timeout = data[1];                /// Second argument is timeout

    for (int i = (timeout - 1); i >= 0; --i) {  /// Send new timeout value to port every second
      await Future.delayed(const Duration(seconds: 1), () => sendPort.send(i));
    }
    sendPort.send(null);                        /// Send to the port null as completion of the isolate
  }

  /// Isolate function for Heavy function
  static Future<void> _isoFunction(List<dynamic> args) async {
    final SendPort sendPort = args[0];          /// First argument is port
    final Function func = args[1];              /// Second argument is function
    final List<dynamic> arguments = args[2];    /// Third argument are arguments of function

    final result = await func(arguments);       /// Get result of function with arguments
    sendPort.send(result);                      /// Send to the port result
  }
}

