import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _cnt = 0;

  late SharedPreferences prefs;
  static const kCounterKey = 'counter';

  @override
  void initState() {
    super.initState();
    _initPref();
  }

  void _initPref() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      _cnt = prefs.getInt(kCounterKey) ?? 0;
    });
  }

  void _incCount() async {
    setState(() => _cnt++);
    await prefs.setInt(kCounterKey, _cnt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Shared pref Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Tap this button many times:'),
            Text('$_cnt', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incCount,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
