//import 'dart:isolate';

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int time = -1;

  Stream<int> _stopwatch() async* {
    while (time >= 0) {
      await Future.delayed(const Duration(seconds: 1));
      yield time--;
    }
  }


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder(
              stream: _stopwatch(),
              builder: (context, snapshot) {
                return (snapshot.connectionState == ConnectionState.active)
                    ? Text(time.toString(), style: const TextStyle(fontSize: 40))
                    : const Text('--', style: TextStyle(fontSize: 40));
              }
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () { // TODO: Start Isolate
                setState(() => time = 30);
                //Isolate.spawn(startTimer, (timeout: 20, sendPort: timerPort.sendPort));
              },
              child: const Text('Start', style: TextStyle(fontSize: 20)),
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
