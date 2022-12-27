import 'package:flutter/material.dart';
import 'package:mobx_sm/fluro_router.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:business_sm/business_sm.dart';

void main() {
  MyFluroRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Store<AppState> store = Store(appReducer, initialState: AppState.initial()); //, middleware: [thunkMiddleware]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
          store: store,
          child: StoreConnector<AppState, ThemeData>(
            converter: (store) => store.state.themeState.value,
            builder: (context, state) => MaterialApp(
              title: 'Flutter Demo',
              theme: state,
              initialRoute: '/',
              onGenerateRoute: MyFluroRouter.router.generator,
            ),
          ),
    );
  }
}

