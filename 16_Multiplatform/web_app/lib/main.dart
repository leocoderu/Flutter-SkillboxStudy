import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'mock_web_view.dart'
if (dart.library.io) 'not_web_view.dart'
if (dart.library.html) 'web_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  String _htmlText = '';

  Future<void> _loadHtmlPage() async {
    final result = await http.get(Uri.parse('http://flutter.dev/'));
    setState(() {
      _htmlText = result.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OS version'), centerTitle: true),
      body:
        Text(_htmlText),
        //webView('https://flutter.dev/'),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadHtmlPage,
        tooltip: 'LOAD',
        child: const Icon(Icons.add),
      )
      ,
    );
  }
}