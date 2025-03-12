import 'package:flutter/material.dart';

import 'package:triple_switch/triple_switch.dart';

import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SwitchState switches = SwitchState();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle'),
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
        child: ListenableBuilder(
            listenable: switches,
            builder: (BuildContext ctx, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Function1 is running now: ${(switches.data['switchSecurity']!.timeout != null) ? switches.data['switchSecurity']!.timeout.toString() : '--'}', style: const TextStyle(fontSize: 20)),
                  Text('Function2 is running now: ${(switches.data['switchFireAlarm']!.timeout != null) ? switches.data['switchFireAlarm']!.timeout.toString() : '--'}', style: const TextStyle(fontSize: 20)),
                  Text('Function3 is running now: ${(switches.data['switchSprinkler']!.timeout != null) ? switches.data['switchSprinkler']!.timeout.toString() : '--'}', style: const TextStyle(fontSize: 20)),
                ],
              );
            }
        ),
      ),
    );
  }
}
