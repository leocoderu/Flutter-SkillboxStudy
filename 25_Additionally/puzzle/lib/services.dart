import 'package:triple_switch/triple_switch.dart';
import 'storage.dart';

Future<void> setupServices() async {

  SwitchState().data = {
    'switchSecurity':  SwitchModel(
        position: await readData('swSecurity'),         /// Read from Storage
        saveFunc: (val) => saveData('swSecurity', val), /// Save to Storage
    ),
    'switchFireAlarm': SwitchModel(
        position: await readData('swFireAlarm'),        /// Read from Storage
        saveFunc: (val) => saveData('swFireAlarm', val) /// Save to Storage
    ),
    'switchSprinkler': SwitchModel(
        position: await readData('swSprinkler'),        /// Read from Storage
        saveFunc: (val) => saveData('swSprinkler', val) /// Save to Storage
    ),
    'switchTemp': SwitchModel(),                        /// Init switch without state
  };

}