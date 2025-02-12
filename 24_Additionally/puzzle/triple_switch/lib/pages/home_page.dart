import 'package:flutter/material.dart';

import 'settings_page.dart';

import '../triple_switch/switcher_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // Initialize Switcher identifiers
    final SwitchState switchers = SwitchState()..data = {
      'switchSecurity': SwitchModel(),
      'switchFireAlarm': SwitchModel(),
      'switchSprinkler': SwitchModel(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collect knowledge'),
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
            listenable: switchers,
            builder: (BuildContext ctx, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Timer1 is now: ${(switchers.data['switchSecurity']!.timeout != null) ? switchers.data['switchSecurity']!.timeout.toString() : '--'}', style: const TextStyle(fontSize: 30)),
                  Text('Timer2 is now: ${(switchers.data['switchFireAlarm']!.timeout != null) ? switchers.data['switchFireAlarm']!.timeout.toString() : '--'}', style: const TextStyle(fontSize: 30)),
                  Text('Timer3 is now: ${(switchers.data['switchSprinkler']!.timeout != null) ? switchers.data['switchSprinkler']!.timeout.toString() : '--'}', style: const TextStyle(fontSize: 30)),
                ],
              );
            }
        ),
      ),
    );
  }
}
