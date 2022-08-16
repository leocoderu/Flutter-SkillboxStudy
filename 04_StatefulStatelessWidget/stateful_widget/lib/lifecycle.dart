import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ExampleLifecycle extends StatefulWidget {
  const ExampleLifecycle({Key? key}) : super(key: key);

  @override
  State<ExampleLifecycle> createState() =>_ExampleLifecycle();
}

class _ExampleLifecycle extends State<ExampleLifecycle> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(onPressed: () {
              setState(() {
                counter++;
              });
            }, child: null),
            if (counter < 5) CounterWidget(counter: counter),
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key, required this.counter}) : super(key: key);
  final int counter;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget>{
  @override
  void initState(){
    super.initState();
    // ignore: avoid_print
    print('INIT STATE');

    // addPostFrameCallback выполняется уже когда Виджет создан и контекст к нему прикреплен
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // ignore: avoid_print
      print('POST FRAME CALLBACK');
      // ignore: avoid_print
      print('brightness: ${Theme.of(context).brightness}');
      // ignore: avoid_print
      print('size: ${MediaQuery.of(context).size.width}');
    });
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    // ignore: avoid_print
    print('DID CHANGE DEPENDENCIES');
    // ignore: avoid_print
    print('brightness: ${Theme.of(context).brightness}');
    // ignore: avoid_print
    print('size: ${MediaQuery.of(context).size.width}');
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('BUILD');
    return Center(
      child: Column(
        children: <Widget>[
          Text('Counter ${widget.counter}'),
          HomeViewCounter (counter: widget.counter),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // ignore: avoid_print
    print('DID UPDATE WIDGET: $oldWidget');
    // ignore: avoid_print
    print('OLD VALUE COUNTER: ${oldWidget.counter}');
  }

  // Когда виджет начинает пропадать
  @override
  void deactivate(){
    super.deactivate();
    // ignore: avoid_print
    print('DEACTIVATE');
  }

  // Когда виджет удаляется из дерева виджетов
  @override
  void dispose(){
    super.dispose();
    // ignore: avoid_print
    print('DISPOSE');
  }
}

class HomeViewCounter extends StatelessWidget {
  const HomeViewCounter({Key? key, required this.counter}) : super(key : key);
  final int counter;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('BUILD COUNTER');
    return Text('Stateless widget counter: $counter');
  }
}