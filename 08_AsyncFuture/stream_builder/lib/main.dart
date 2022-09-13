import 'package:flutter/material.dart';
import 'dart:math';

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

  Stream<int> getRandomValue(int count) async* {
    var random = Random(2);
    while(count > 0) {
      count--;
      await Future.delayed(const Duration(seconds: 1));
      yield random.nextInt(100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Future Builder'),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: getRandomValue(7),
          builder: (BuildContext context, AsyncSnapshot snapshot){
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                      child: Text('None'),
                  );
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator()
                  );
                case ConnectionState.active:
                  return Center(
                      child: Text('${snapshot.data}')
                  );
                case ConnectionState.done:
                  return const Center(
                      child: Text('Done')
                  );
                default:
                  return const Center(
                    child: Text('Default')
                );
              }
           }
        )
    );
  }
}
