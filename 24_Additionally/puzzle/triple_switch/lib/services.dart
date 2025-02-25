import 'package:triple_switch/storage.dart';

import 'triple_switch/switch_state.dart';

Future<void> setupServices() async {

  SwitchState().data = {
    'switchSecurity':  SwitchModel(
        await readData('swSecurity'),         /// Read from Storage
        (val) => saveData('swSecurity', val)  /// Save to Storage
    ),
    'switchFireAlarm': SwitchModel(
        await readData('swFireAlarm'),        /// Read from Storage
        (val) => saveData('swFireAlarm', val) /// Save to Storage
    ),
    'switchSprinkler': SwitchModel(
        await readData('swSprinkler'),        /// Read from Storage
        (val) => saveData('swSprinkler', val) /// Save to Storage
    ),
  };

}