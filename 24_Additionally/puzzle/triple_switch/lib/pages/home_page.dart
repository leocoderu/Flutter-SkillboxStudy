import 'package:flutter/material.dart';

import '../triple_switch/switch_state.dart';

import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SwitchState switches = SwitchState();

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
            listenable: switches,
            builder: (BuildContext ctx, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Timer1 is now: ${(switches.data['switchSecurity']!.timeout != null) ? switches.data['switchSecurity']!.timeout.toString() : '--'}', style: const TextStyle(fontSize: 30)),
                  Text('Timer2 is now: ${(switches.data['switchFireAlarm']!.timeout != null) ? switches.data['switchFireAlarm']!.timeout.toString() : '--'}', style: const TextStyle(fontSize: 30)),
                  Text('Timer3 is now: ${(switches.data['switchSprinkler']!.timeout != null) ? switches.data['switchSprinkler']!.timeout.toString() : '--'}', style: const TextStyle(fontSize: 30)),
                ],
              );
            }
        ),
      ),
    );
  }
}
