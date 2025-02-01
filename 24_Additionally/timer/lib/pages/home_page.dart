import 'package:flutter/material.dart';

import 'package:timer/pages/settings_page.dart';

import '../switcher_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // Initialize Switcher identifiers
    final SwitcherState switchers = SwitcherState()..data = {
      'switch1': SwitcherModel(),
      'switch2': SwitcherModel(),
      'switch3': SwitcherModel(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Timer'),
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
                  Text('Timer1 is now: ${(switchers.data['switch1']!.active) ? switchers.data['switch1']!.timeout.toString() : '--'}', style: const TextStyle(fontSize: 30)),
                  Text('Timer2 is now: ${(switchers.data['switch2']!.active) ? switchers.data['switch2']!.timeout.toString() : '--'}', style: const TextStyle(fontSize: 30)),
                  Text('Timer3 is now: ${(switchers.data['switch3']!.active) ? switchers.data['switch3']!.timeout.toString() : '--'}', style: const TextStyle(fontSize: 30)),
                ],
              );
            }
        ),
      ),
    );
  }
}
