import 'triple_switch/switch_state.dart';

Future<void> setupServices() async {

  SwitchState().data = {
    'switchSecurity':  SwitchModel(false), /// TODO: Возможно false нужно брать из хранилища
    'switchFireAlarm': SwitchModel(false), /// TODO: но как туда сохранять?
    'switchSprinkler': SwitchModel(false),
  };

}