//import 'dart:isolate';

import 'package:triple_switch/triple_switch.dart';

import 'package:flutter/material.dart';

import '../email_conform_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // int time = -1;
  //
  // Stream<int> _stopwatch() async* {
  //   while (time >= 0) {
  //     await Future.delayed(const Duration(seconds: 1));
  //     yield time--;
  //   }
  // }


  //final timerPort = ReceivePort();

  //int? time;

  // _initListenable() {
  //   timerPort.listen((tm) {
  //     print('I have listen: $tm');
  //     // setState(() {
  //     //     time = tm;
  //     // });
  //   });
  // }

  // @override
  // void initState() {
  //   _initListenable();
  //   super.initState();
  // }

  final ValueNotifier<int> valueListenable = ValueNotifier<int>(TimerService().seconds);

  SwitchPosition swPosState1 = SwitchPosition.off;
  SwitchPosition swPosState2 = SwitchPosition.off;
  SwitchPosition swPosState3 = SwitchPosition.off;
  SwitchPosition swPosState4 = SwitchPosition.off;

  @override
  Widget build(BuildContext context) {
    //TimerService timerService = TimerService();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder(
                valueListenable: valueListenable,
                builder: (BuildContext ctx, value, child) {
                  return
                    (TimerService().timer?.isActive ?? false)
                        ? Text(value.toString(), style: const TextStyle(fontSize: 40))
                        : const Text('--', style: TextStyle(fontSize: 40));
                }
            ),
            // (TimerService().timer?.isActive ?? false)
            //   ? Text(timerService.seconds.toString(), style: const TextStyle(fontSize: 40))
            //   : const Text('--', style: TextStyle(fontSize: 40)),

            // StreamBuilder(
            //   stream: _stopwatch(),
            //   builder: (context, snapshot) {
            //     return (snapshot.connectionState == ConnectionState.active)
            //         ? Text(time.toString(), style: const TextStyle(fontSize: 40))
            //         : const Text('--', style: TextStyle(fontSize: 40));
            //   }
            // ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () { // TODO: Start Isolate
                setState(() => TimerService().start());
                //Isolate.spawn(startTimer, (timeout: 20, sendPort: timerPort.sendPort));
              },
              child: const Text('Start', style: TextStyle(fontSize: 20)),
            ),


            const SizedBox(height: 10),
            TripleSwitch(
              position: swPosState1,
              timeoutOffOn: 20,
              //timeoutOnOff: 0,
              onChanged: (value) => setState(() => swPosState1 = value),
            ),
            const SizedBox(height: 10),
            TripleSwitch(
              position: swPosState2,
              //timeoutOffOn: 20,
              //timeoutOnOff: 0,
              onChanged: (value) => setState(() => swPosState2 = value),
            ),
            const SizedBox(height: 10),
            TripleSwitch(
              position: swPosState3,
              //timeoutOffOn: 20,
              //timeoutOnOff: 0,
              onChanged: (value) => setState(() => swPosState3 = value),
            ),
            const SizedBox(height: 10),
            TripleSwitch(
              position: swPosState4,
              //timeoutOffOn: 20,
              //timeoutOnOff: 0,
              onChanged: (value) => setState(() => swPosState4 = value),
            ),
          ],
        ),
      ),
    );
  }
}

// void startTimer(({int timeout, SendPort sendPort}) data) async {
//   for (int i = (data.timeout - 1); i >= 0; --i) {
//     await Future.delayed(const Duration(seconds: 1), () => data.sendPort.send(i));
//   }
//   data.sendPort.send(null);
//   //print('isolate finished');
// }
