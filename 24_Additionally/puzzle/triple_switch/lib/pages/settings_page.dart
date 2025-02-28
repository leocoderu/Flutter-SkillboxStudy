import 'package:flutter/material.dart';

import '../triple_switch/switch_state.dart';
import '../triple_switch/triple_switch.dart';

import '../heavy_functions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SwitchState switches = SwitchState();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ListenableBuilder(
          listenable: switches,
          builder: (BuildContext ctx, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text((switches.data['switchSecurity']!.result != null)
                  ? '${switches.data['switchSecurity']!.result.toString()} ( ${switches.data['switchSecurity']!.success.toString()} )'
                  : 'No result'
                ),
                const TripleSwitch(
                  id: 'switchSecurity',
                  timeoutOffOn: 50,
                  timeoutOnOff: 15,
                  functionOffOn: heavyFunction1,
                  functionOnOff: heavyFunction3,
                  argumentsOffOn: [923000000],
                  argumentsOnOff: [12, 12],
                ),
                const SizedBox(height: 10),
                Text((switches.data['switchFireAlarm']!.result != null)
                  ? '${switches.data['switchFireAlarm']!.result.toString()} ( ${switches.data['switchFireAlarm']!.success.toString()} )'
                  : 'No result'
                ),
                const TripleSwitch(
                  id: 'switchFireAlarm',
                  timeoutOffOn: 50,
                  timeoutOnOff: null,
                  functionOffOn: heavyFunction2,
                  functionOnOff: null,
                  argumentsOffOn: [223000000, 'Second Func'],
                  argumentsOnOff: null,
                ),
                const SizedBox(height: 10),
                Text((switches.data['switchSprinkler']!.result != null)
                  ? '${switches.data['switchSprinkler']!.result.toString()} ( ${switches.data['switchSprinkler']!.success.toString()} )'
                  : 'No result'
                ),
                const TripleSwitch(
                  id: 'switchSprinkler',
                  timeoutOffOn: 15,
                  //timeoutOnOff: null,
                  functionOffOn: heavyFunction3,
                  //functionOnOff: null,
                  argumentsOffOn: [16, 2],
                  //argumentsOnOff: null,
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
