import 'package:flutter/material.dart';
import 'package:state_management/fluro_router.dart';

void main() {
  MyFluroRouter.setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      onGenerateRoute: MyFluroRouter.router.generator,
    );
  }
}


