import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:state_management/app_state.dart';
import 'package:state_management/fluro_router.dart';


void main() {
  MyFluroRouter.setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: Consumer<AppState>(
        builder: (context, state, child) =>
            MaterialApp(
              title: 'Flutter Demo',
              theme: state.currentTheme, //context.watch<AppState>().currentTheme,
              initialRoute: '/',
              onGenerateRoute: MyFluroRouter.router.generator,
            ),
      ),
    );
  }
}


