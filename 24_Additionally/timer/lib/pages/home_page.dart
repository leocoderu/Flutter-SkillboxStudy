import 'package:flutter/material.dart';


import 'package:timer/pages/settings_page.dart';
//import 'package:timer/repository_notifiers.dart';

import '../switcher_notifier2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SwitchNotifier switchNotifier = SwitchNotifier();

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
            const Text('Timer1 is now:', style: TextStyle(fontSize: 30)),
            ListenableBuilder(
                listenable: switchNotifier,
                builder: (BuildContext ctx, child) {
                  return
                    (switchNotifier.data['switch1']!.active)
                        ? Text(switchNotifier.data['switch1']!.timeout.toString(), style: const TextStyle(fontSize: 60))
                        : const Text('--', style: TextStyle(fontSize: 60));
                }
            ),

            const Text('Timer2 is now:', style: TextStyle(fontSize: 30)),
            ListenableBuilder(
                listenable: switchNotifier,
                builder: (BuildContext ctx, child) {
                  return
                    (switchNotifier.data['switch2']!.active)
                        ? Text(switchNotifier.data['switch2']!.timeout.toString(), style: const TextStyle(fontSize: 60))
                        : const Text('--', style: TextStyle(fontSize: 60));
                }
            ),
          ],
        ),
      ),
    );
  }
}
