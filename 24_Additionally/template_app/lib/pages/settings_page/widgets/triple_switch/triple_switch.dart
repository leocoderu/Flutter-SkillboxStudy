// // Import Dart and Flutter
// import 'dart:isolate';
// import 'package:flutter/material.dart';
//
// import 'package:template_app/pages/settings_page/widgets/triple_switch/triple_switch_ui.dart';
//
// class TripleSwitch extends StatefulWidget {
//   final switchPosition swPos;
//   final int? timeoutOffOn;
//   final int? timeoutOnOff;
//
//   const TripleSwitch({super.key, required this.swPos, this.timeoutOffOn, this.timeoutOnOff});
//
//   @override
//   State<TripleSwitch> createState() => _TripleSwitchState();
// }
//
// class _TripleSwitchState extends State<TripleSwitch> {
//   final timerPort = ReceivePort();
//
//   // states
//   int? timeout;               // Timer of timeout
//   late switchPosition swPos;  // Current switch position
//   late switchPosition prePos; // For save switch position before change to wait
//
//   void _initListener() {
//     //if (timerPort.isBroadcast)
//       timerPort.listen((time) {
//         //setState(() {
//           // if (time != null) {
//           //   timeout = time;
//           // } else {
//           //   swPos = prePos;
//           // }
//           print('I have listen some thing, like: $time');
//           if (time == null) timerPort.close();
//         //})
//       });
//   }
//
//   int? timeoutByDirection() =>
//     (swPos == switchPosition.off) ? widget.timeoutOffOn : widget.timeoutOnOff;
//
//   @override
//   void initState() {
//     _initListener();
//
//     prePos = swPos = widget.swPos;
//     print('init timeout: $timeout');
//
//     timeout = timeoutByDirection();
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     // Инверсия позиции тумблера
//     // switchPosition iPos(switchPosition swPos) =>
//     //     (swPos == switchPosition.on) ? switchPosition.off : switchPosition.on;
//     //
//     // Если Таймер еще идет и получен результат с Изолята, если результат положительный
//     // Переключаем тумблер дальше, иначе возвращаем в исходную позицию
//     // if ((timeOut != null) && (resData.exist)) {
//     //   swPos = resData ? iPos(prePos) : prePos;
//     // }
//
//
//     return TripleSwitchUI(
//       value: swPos,
//       timeout: timeout,
//       onChanged: (value) {
//         //onChanged(value);
//         if (value == switchPosition.wait) {
//           setState(() => prePos = swPos);
//           setState(() => timeout = timeoutByDirection()); // TODO: Bind them to one setState
//
//           // Запуск обратного отчета таймера
//           Isolate.spawn(startTimer, (timeout: timeout ?? 0, sendPort: timerPort.sendPort));
//         }
//         setState(() => swPos = value);
//         // Запуск Изолята
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
//
// void startTimer(({int timeout, SendPort sendPort}) data) async {
//   for(int i = (data.timeout - 1); i >= 0; --i) {
//     await Future.delayed(const Duration(seconds: 1), () => data.sendPort.send(i));
//   }
//   data.sendPort.send(null);
//   print('isolate finished');
// }