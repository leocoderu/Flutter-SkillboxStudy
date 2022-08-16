import 'package:flutter/material.dart';
import 'package:stateful_widget/keys.dart';
//import 'package:stateful_widget/lifecycle.dart';
//import 'package:stateful_widget/observer.dart';
//import 'package:stateful_widget/stateless.dart';
//import 'package:stateful_widget/value_notifier.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const ExampleLifecycle(),
      //home: const ExampleObserver(),
      //home: const ExampleStateless(),
      //home: const ExampleValueNotifier(),
      home: const ExampleKeys(),
    );
  }
}
