import 'package:business_sm/actions/counter_actions.dart';
import 'package:business_sm/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux_sm/pages/home_page/home_page.dart';

class HomePageConnector extends StatelessWidget {
  final String title;
  const HomePageConnector({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, state) {
        return HomePage(
          title: title,
          value: state.value,
          increase: state.onIncrease,
          decrease: state.onDecrease,
        );
      },
    );
  }
}

class _ViewModel {
  final int value;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  _ViewModel({required this. value, required this.onIncrease, required this.onDecrease});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      value: store.state.counterState.value,
      onIncrease: () => store.dispatch(CounterIncrementAction()),
      onDecrease: () => store.dispatch(CounterDecrementAction()),
    );
  }
}