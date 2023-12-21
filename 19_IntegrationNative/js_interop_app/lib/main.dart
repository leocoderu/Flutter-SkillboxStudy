import 'dart:async';

import 'package:flutter/material.dart';
import 'package:js_interop_app/platform/platform_widget.dart';
import 'package:js_interop_app/platform/service.dart';

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
  final _service = getService();
  StreamSubscription? _subscription;
  int _cnt = 0;

  void _getValue() async {
    final value = await _service.getValue();
    setState(() => _cnt = value);
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headlineMedium;
    return Scaffold(
        appBar: AppBar(title: const Text('Platform Channels'), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('UI component from platform:', style: style),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: getWidget() as Widget,
                ),
              ),
              Text('Stream from platform:', style: style),
              StreamBuilder<int>(
                stream: _service.getStream(),
                builder: (context, snapshot) => Text(
                  '${snapshot.hasData ? snapshot.data : 'No data'}',
                  style: style,
                ),
              ),
              Text('Value from Platform', style: style),
              Text('$_cnt', style: style),
            ],
          ),
        ),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: _getValue,
                heroTag: null,
                child: const Icon(Icons.get_app),
              ),
            ]
        )
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
