import 'package:flutter/material.dart';

import '../switcher_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SwitchState switchers = SwitchState();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ListenableBuilder(
          listenable: switchers,
          builder: (BuildContext ctx, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Timer1 is ${switchers.data['switch1']!.active ? 'ON: ' : 'OFF: '}', style: const TextStyle(fontSize: 20)),
                    Text((switchers.data['switch1']!.active) ? switchers.data['switch1']!.timeout.toString() : '--', style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => switchers.start('switch1', 20),
                      child: const Text('Start', style: TextStyle(fontSize: 20)),
                    ),
                    ElevatedButton(
                      onPressed: () => switchers.stop('switch1'),
                      child: const Text('Stop', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Timer2 is ${switchers.data['switch2']!.active ? 'ON: ' : 'OFF: '}', style: const TextStyle(fontSize: 20)),
                    Text((switchers.data['switch2']!.active) ? switchers.data['switch2']!.timeout.toString() : '--', style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => switchers.start('switch2', 35),
                      child: const Text('Start', style: TextStyle(fontSize: 20)),
                    ),
                    ElevatedButton(
                      onPressed: () => switchers.stop('switch2'),
                      child: const Text('Stop', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Timer3 is ${switchers.data['switch3']!.active ? 'ON: ' : 'OFF: '}', style: const TextStyle(fontSize: 20)),
                    Text((switchers.data['switch3']!.active) ? switchers.data['switch3']!.timeout.toString() : '--', style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => switchers.start('switch3', 15),
                      child: const Text('Start', style: TextStyle(fontSize: 20)),
                    ),
                    ElevatedButton(
                      onPressed: () => switchers.stop('switch3'),
                      child: const Text('Stop', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
