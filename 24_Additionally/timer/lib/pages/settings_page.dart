import 'package:flutter/material.dart';

import '../switcher_notifier2.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SwitchNotifier switchNotifier = SwitchNotifier();
    //final SwitchNotifier switchNotifier = repo.getNotifier('switch1')!;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListenableBuilder(
                listenable: switchNotifier,
                builder: (BuildContext ctx, child) {
                  return
                    Column(
                      children: [
                        Text('Timer1 is ${switchNotifier.data['switch1']!.active ? 'ON' : 'OFF'}', style: const TextStyle(fontSize: 30)),
                        const SizedBox(height: 10),
                        (switchNotifier.data['switch1']!.active)
                          ? Text(switchNotifier.data['switch1']!.timeout.toString(), style: const TextStyle(fontSize: 40))
                          : const Text('--', style: TextStyle(fontSize: 40)),
                      ],
                    );
                }
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => switchNotifier.start('switch1', 20),
              child: const Text('Start', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 50),

            ListenableBuilder(
                listenable: switchNotifier,
                builder: (BuildContext ctx, child) {
                  return
                    Column(
                      children: [
                        Text('Timer2 is ${switchNotifier.data['switch2']!.active ? 'ON' : 'OFF'}', style: const TextStyle(fontSize: 30)),
                        const SizedBox(height: 10),
                        (switchNotifier.data['switch2']!.active)
                            ? Text(switchNotifier.data['switch2']!.timeout.toString(), style: const TextStyle(fontSize: 40))
                            : const Text('--', style: TextStyle(fontSize: 40)),
                      ],
                    );
                }
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => switchNotifier.start('switch2', 35),
              child: const Text('Start', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
