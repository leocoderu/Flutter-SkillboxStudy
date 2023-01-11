import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Life Cycle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = DateTime.now().toString();
  bool isTextVisible = true;
  ThemeData _currentTheme = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Theme(
        data: _currentTheme,
        child: Center(
          child: Visibility(
            visible: isTextVisible,
            child: MyStatefulWidget(
              title: text,
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                text = DateTime.now().toString();
              });
            },
            tooltip: 'Chair',
            child: const Icon(Icons.chair),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                isTextVisible = !isTextVisible;
              });
            },
            tooltip: 'Increment',
            child: const Icon(Icons.hide_image),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _currentTheme = ThemeData.dark();
              });
            },
            tooltip: 'Increment',
            child: const Icon(Icons.theater_comedy),
          ),
        ],
      )
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final String title;

  const MyStatefulWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() {
    //ignore: avoid print
    print('[CREATE STATE] - called');
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = 0;
    print('[INIT STATE] - called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('[DID CHANGE DEPENDENCIES] - called');
  }

  @override
  void didUpdateWidget(covariant MyStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('[DID UPDATE WIDGET] - called');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('[SET STATE] - called');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('[MOUNTED] - $mounted');
    print('[DEACTIVATE] - called');
    Timer(Duration(seconds: 1), () {
      print('[MOUNTED] - $mounted');
    });
  }

  @override
  void dispose() {
    print('[DISPOSE] - called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('[BUILD] - called');
    return GestureDetector(
        onTap: () {
          setState(() {
            _counter++;
          });
        },
        child: Text(
          widget.title + '  -  ' + _counter.toString(),
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
    );
  }
}
