import 'dart:isolate';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Isolate Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/gifs/pic.gif'),
            // Without Isolate
            ElevatedButton(
              onPressed: () {
                double res = countTotal1();
                debugPrint('result #1: $res');
              },
              child: const Text('The biggest task in basic threat'),
            ),
            // With Async / Await
            ElevatedButton(
              onPressed: () async {
                double res = await countTotal2();
                debugPrint('result #2: $res');
              },
              child: const Text('The biggest task with Async/Await'),
            ),
            // With Isolate
            ElevatedButton(
              onPressed: () async {
                final receivePort = ReceivePort();
                await Isolate.spawn(countTotal3, receivePort.sendPort);
                receivePort.listen((res) {
                  debugPrint('result #3: $res');

                });
              },
              child: const Text('The biggest task with Isolate'),
            ),
            // With Isolate and Parameters
            ElevatedButton(
              onPressed: () async {
                final receivePort = ReceivePort();
                await Isolate.spawn(countTotal4, (iteration: 1000000000, sendPort: receivePort.sendPort));
                receivePort.listen((mes) {
                  debugPrint('result #4: $mes');
                });
              },
              child: const Text('The biggest task with Isolate with Param'),
            ),
          ],
        ),
      ),
    );
  }

  double countTotal1() {
    double total = 0.0;
    for (double i=0; i < 1000000000; i++) {
      total += i;
    }
    return total;
  }

  Future<double> countTotal2() async {
    double total = 0.0;
    for (double i=0; i < 1000000000; i++){
      total += i;
    }
    return total;
  }
}

countTotal3(SendPort sendPort) {
  double total = 0.0;
  for (double i=0; i < 1000000000; i++){
    total += i;
  }
  sendPort.send(total);
}

countTotal4(({int iteration, SendPort sendPort}) data) {
  var total = 0.0;
  for (var i = 0; i < data.iteration; i++) {
    total += i;
  }
  data.sendPort.send(total);
}