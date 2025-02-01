// import 'dart:async';
// import 'dart:isolate';
//
// import 'package:flutter/material.dart';
//
// class SwitchNotifier extends ChangeNotifier {
//
//   int  timeout = 0;     // Timer value (0 - N)
//   bool active = false;  // State timer, false - off / true - on
//
//   SwitchNotifier._();
//   static final SwitchNotifier _switchNotifier = SwitchNotifier._();
//   factory SwitchNotifier() => _switchNotifier;
//
//   void start(int time) {
//     final timerPort = ReceivePort();
//     if (active) return;
//     timeout = time;
//     active = true;
//     Isolate.spawn(startTimer, (timeout: timeout, sendPort: timerPort.sendPort));
//     _listener(timerPort);
//     notifyListeners();
//   }
//
//   void _listener(ReceivePort port) {
//     port.listen((time) {
//       if (time >= 0) {
//         timeout = time;
//         notifyListeners();
//       } else {
//         active = false;
//         notifyListeners();
//         port.close();
//       }
//     });
//   }
//
//   void stop() async {
//     timeout = 0;
//     active = false;
//     notifyListeners();
//   }
// }
//
// void startTimer(({int timeout, SendPort sendPort}) data) async {
//   for (int i = (data.timeout - 1); i >= -1; --i) {
//     await Future.delayed(const Duration(seconds: 1), () => data.sendPort.send(i));
//   }
// }