import 'package:flutter/material.dart';
import 'package:list_view_divider/list_vew_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View Divider App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListViewDivider(),
    );
  }
}



