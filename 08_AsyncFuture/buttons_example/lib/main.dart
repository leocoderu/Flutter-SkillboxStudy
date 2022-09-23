import 'package:flutter/material.dart';
import 'package:buttons_example/file_reader.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FileReader(),
    );
  }
}

