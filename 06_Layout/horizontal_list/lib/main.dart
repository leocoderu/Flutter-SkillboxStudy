import 'package:flutter/material.dart';
import 'package:horizontal_list/horizontal_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HorizontalList(),
    );
  }
}

