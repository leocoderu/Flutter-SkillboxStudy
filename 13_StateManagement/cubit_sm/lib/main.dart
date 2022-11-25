import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

//enum CounterEvent { increase, decrease }

class CounterBloc {
  int value = 0;
  final _stateController = StreamController<int>();
  //final _eventsController = StreamController<CounterEvent>();

  Stream<int> get state => _stateController.stream;
  //Sink<CounterEvent> get action => _eventsController.sink;

  // CounterBloc(){
  //   _eventsController.stream.listen(_handleEvent);
  // }

  void increment() {
    value++;
    _stateController.add(value);
  }

  // void _handleEvent(CounterEvent action) async {
  //   switch (action) {
  //     case CounterEvent.increase:
  //       value++;
  //       break;
  //     case CounterEvent.decrease:
  //       value--;
  //       break;
  //     default:
  //       break;
  //   }
  //   _stateController.add(value);
  // }

  void dispose() {
    _stateController.close();
    //_eventsController.close();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  late final CounterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CounterBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print('I was burn!');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            StreamBuilder<int>(
                stream: bloc.state,
                builder: (_, snapshot) {
                  return Text(
                    snapshot.data?.toString() ?? '',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: FloatingActionButton(
              //onPressed: () => bloc.action.add(CounterEvent.increase),
              onPressed: () => bloc.increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      )
    );
  }
}
