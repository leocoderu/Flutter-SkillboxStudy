import 'package:flutter/material.dart';

import 'package:block_sm/fluro_router.dart';
import 'package:business_sm/business_sm.dart';

void main() {
  MyFluroRouter.setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  late final ThemeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ThemeBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       title: 'Flutter Demo',
  //       theme: bloc.theme,
  //       initialRoute: '/',
  //       onGenerateRoute: MyFluroRouter.router.generator,
  //   );
  // }

  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
        stream: bloc.state,
        builder: (_, snapshot) {
          print(snapshot.data.toString());
          return MaterialApp(
            title: 'Flutter Demo',
            theme: snapshot.data,
            initialRoute: '/',
            onGenerateRoute: MyFluroRouter.router.generator,
          );
        },
    );
  }
}
