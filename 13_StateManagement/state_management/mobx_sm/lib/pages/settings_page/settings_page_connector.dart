import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:business_sm/actions/theme_actions.dart';
import 'package:business_sm/model/app_state.dart';
import 'package:mobx_sm/pages/settings_page/settings_page.dart';

class SettingsPageConnector extends StatelessWidget {
  const SettingsPageConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, state) {
        return SettingsPage(
          theme: state.value,
          press_light: state.onLight,
          press_dark: state.onDark,
          press_system: state.onSystem,
        );
      },
    );
  }
}

class _ViewModel {
  final ThemeData value;
  final VoidCallback onLight;
  final VoidCallback onDark;
  final VoidCallback onSystem;

  _ViewModel({required this. value, required this.onLight, required this.onDark, required this.onSystem});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      value: store.state.themeState.value,
      onLight: () => store.dispatch(ChangeToLightAction()),
      onDark: () => store.dispatch(ChangeToDarkAction()),
      onSystem: () => store.dispatch(ChangeToSystemAction()),
    );
  }
}