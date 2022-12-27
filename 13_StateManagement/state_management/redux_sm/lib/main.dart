import 'package:flutter/material.dart';
import 'package:redux_sm/fluro_router.dart';
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
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: Colors.blue),
            initialRoute: '/',
            onGenerateRoute: MyFluroRouter.router.generator,
          ),
    );
  }
}

