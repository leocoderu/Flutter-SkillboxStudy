//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer/pages/settings_page.dart';

import '../email_conform_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ValueNotifier<int> valueListenable = ValueNotifier<int>(TimerService().seconds);


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SettingsPage())),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Timer is now:', style: TextStyle(fontSize: 30)),
            // StreamBuilder(
            //   stream: _stopwatch(),
            //   builder: (context, snapshot) {
            //     return (snapshot.connectionState == ConnectionState.active)
            //       ? Text(snapshot.data.toString(), style: const TextStyle(fontSize: 60))
            //       : const Text('--', style: TextStyle(fontSize: 60));
            //   }
            // ),
            ValueListenableBuilder(
                valueListenable: valueListenable,
                builder: (BuildContext ctx, value, child) {
                  return
                    (TimerService().timer?.isActive ?? false)
                        ? Text(value.toString(), style: const TextStyle(fontSize: 60))
                        : const Text('--', style: TextStyle(fontSize: 60));
                }
            ),

            // (TimerService().timer?.isActive ?? false)
            //   ? Text(timerService.seconds.toString(), style: const TextStyle(fontSize: 60))
            //   : const Text('--', style: TextStyle(fontSize: 60)),
          ],
        ),
      ),
    );
  }



}
