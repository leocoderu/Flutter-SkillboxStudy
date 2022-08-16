import 'package:flutter/material.dart';
import 'stateful_stateless.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Stateless Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StatefulStatelessWidget(),
    );
  }
}