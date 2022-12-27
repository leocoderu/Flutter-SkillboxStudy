import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(MyApp());

class CounterIncrementAction {}

@immutable
class AppState {
  final int value;
  final bool isLoaded;

  const AppState({
    this.value = 0,
    this.isLoaded = false,
  });

  factory AppState.initial() => const AppState();

  AppState copyWith({
    int? value,
    bool? isLoaded,
  }) {
    return AppState(
      value: value ?? this.value,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  // Переопределяем длля полноценной работы с объектом
  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is AppState && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'AppState{value: $value}';
  }
}

int _increment(int value, CounterIncrementAction action) => ++value;

final _incrementReducer = combineReducers<int>([
  TypedReducer<int, CounterIncrementAction>(_increment),
]);

AppState appReducer(AppState state, action) {
  return AppState(
    value: _incrementReducer(state.value, action),
  );
}

class CounterConnector extends StatelessWidget {
  const CounterConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return MyHomePage(
              title: 'Flutter Demo Home Page',
              value: vm.value,
              increase: vm.onIncrease,
          );
        },
    );
  }
}

class _ViewModel {
  final int value;
  final VoidCallback onIncrease;
  _ViewModel({
    required this. value,
    required this.onIncrease
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
    value: store.state.value,
    onIncrease: () => store.dispatch(CounterIncrementAction()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo App',
          theme: ThemeData(primaryColor: Colors.blue),
          home: const CounterConnector(),
        ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.value,
    required this.increase,
  });

  final String title;
  final int value;
  final VoidCallback increase;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              value.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increase,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
