import 'package:flutter/material.dart';

import '../heavy_functions.dart';
import '../triple_switch/switcher_state.dart';
import '../triple_switch/triple_switch.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool swSecurity  = false;
  bool swFireAlarm = false;
  bool swSprinkler = false;

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
                TripleSwitch(
                  id: 'switchSecurity',
                  value: swSecurity,
                  timeoutOffOn: 20,
                  timeoutOnOff: 20,
                  actionOffOn: heavyFunction1,
                  actionOnOff: heavyFunction1,
                  argumentsOffOn: const [1230000000],
                  argumentsOnOff: const [1230000000],
                  onChanged: (value) => setState(() => swSecurity = value),
                  onResult: (value) => debugPrint('Settings Result: $value'),
                ),
                const SizedBox(height: 10),
                TripleSwitch(
                  id: 'switchFireAlarm',
                  value: swFireAlarm,
                  timeoutOffOn: 35,
                  timeoutOnOff: null,
                  actionOffOn: heavyFunction2,
                  actionOnOff: null,
                  argumentsOffOn: const [100000000, 'Second Func'],
                  argumentsOnOff: null,
                  onChanged: (value) => setState(() => swFireAlarm = value),
                  onResult: (value) => debugPrint('Settings Result: $value'),
                ),
                const SizedBox(height: 10),
                TripleSwitch(
                  id: 'switchSprinkler',
                  value: swSprinkler,
                  timeoutOffOn: 15,
                  timeoutOnOff: null,
                  actionOffOn: heavyFunction3,
                  actionOnOff: null,
                  argumentsOffOn: const [16, 2],
                  argumentsOnOff: null,
                  onChanged: (value) => setState(() => swSprinkler = value),
                  onResult: (value) => debugPrint('Settings Result: $value'),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
