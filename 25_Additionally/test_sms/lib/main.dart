import 'package:flutter/material.dart';

import 'package:sms_receiver/sms_receiver.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
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
  String? _textContent = 'Waiting for messages...';

  SmsReceiver? _smsReceiver;

  @override
  void initState() {
    super.initState();
    _smsReceiver = SmsReceiver(onSmsReceived, onTimeout: onTimeout);
    _startListening();
  }

  void onSmsReceived(String? message) {
    setState(() {
      _textContent = message;
    });
  }

  void onTimeout() {
    setState(() {
      _textContent = 'Timeout!!!';
    });
  }

  void _startListening() async {
    if (_smsReceiver == null) return;
    await _smsReceiver?.startListening();
    setState(() {
      _textContent = 'Waiting for messages...';
    });
  }

  void _stopListening() async {
    if (_smsReceiver == null) return;
    await _smsReceiver?.stopListening();
    setState(() {
      _textContent = 'Listener Stopped';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SMS Listener App'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: Text(_textContent ?? 'empty'),
            ),
            ElevatedButton(
              onPressed: _startListening,
              child: const Text('Listen Again'),
            ),
            ElevatedButton(
              onPressed: _stopListening,
              child: const Text('Stop Listener'),
            ),
          ],
        ),
      ),
    );
  }
}
