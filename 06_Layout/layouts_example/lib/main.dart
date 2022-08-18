import 'package:flutter/material.dart';
//import 'package:layouts_example/example_list_grid.dart';
import 'package:layouts_example/keep_alive_example.dart';

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
      //home: const SingleChildScrollViewExample(),
      //home: const ListGridExample(),
      home: const KeepAliveExample(),
    );
  }
}