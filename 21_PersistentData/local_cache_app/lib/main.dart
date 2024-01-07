import 'package:flutter/material.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Cache Demo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _controller;
  late File file;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _init();
  }

  void _saveProgress() => file.writeAsString(_controller.text);

  Future<void> _init() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    file = File('${appDocDir.path}/file_name.txt');

    if (await file.exists()) {
      _controller.text = await file.readAsString();
      //_controller.text = (await file.readAsBytes()).join(' ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local cache'),centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: TextField(controller: _controller),
            ),
            ElevatedButton(
              onPressed: _saveProgress,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
