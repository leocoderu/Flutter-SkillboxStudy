//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

enum CounterEvent { increase, decrease }

//class CounterBloc extends Bloc<CounterEvent, int> {
class CounterBloc extends Cubit<int> {
  CounterBloc() : super(0) {
    emit(0);
  }

  int value = 0;

  // CounterBloc() : super(0) {
  //   on<CounterEvent>((event, emit) {
  //     switch (event) {
  //         case CounterEvent.increase:
  //           emit(value++);
  //           break;
  //         case CounterEvent.decrease:
  //           emit(value--);
  //           break;
  //         default:
  //           break;
  //     }
  //   });
  // }

  // This methods doesn't work, result on the screen doesn't show
  // Stream<int> increment() async* {
  //   value++;
  //   yield value;
  // }
  // Stream<int> decrement() async* {
  //   value--;
  //   yield value;
  // }

  Future<void> increment() async {
    value++;
    emit(value);
  }

  Future<void> decrement() async {
    value--;
    emit(value);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider<CounterBloc>(                              // Added BlockProvider
        create: (_) => CounterBloc(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    //print('I was burn!');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed buttons this many times:'),
            BlocBuilder<CounterBloc, int>(                          //Added BlocBuilder
                builder: (_, state) =>
                    Text(
                      state.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    )
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: FloatingActionButton(
              //onPressed: () => context.read<CounterBloc>().add(CounterEvent.increase),
              onPressed: context.read<CounterBloc>().increment,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: FloatingActionButton(
              //onPressed: () => context.read<CounterBloc>().add(CounterEvent.decrease),
              onPressed: context.read<CounterBloc>().decrement,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      )
    );
  }
}
