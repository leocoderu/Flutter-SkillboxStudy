import 'package:flutter/material.dart';
import 'package:stateful_widget/example_notifier.dart';
import 'profile.dart';

class ExampleValueNotifier extends StatefulWidget {
  const ExampleValueNotifier({Key? key}) : super(key: key);

  @override
  State<ExampleValueNotifier> createState() =>_ExampleValueNotifierState();
}

class _ExampleValueNotifierState extends State<ExampleValueNotifier> {
  final ValueNotifier<int> counterNotifier = ValueNotifier<int>(0);
  final ValueNotifier<List<int>> arrayNotifier = ValueNotifier<List<int>>([]);

  List<int> array= [];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('BUILD');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Value Notifier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(onPressed: () {
                    setState(() {
                      counter++;
                    });
                  }, child: const Text('counter setState')
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(child: Text('$counter'))
              ],
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(onPressed: () {
                      counterNotifier.value++;
                  }, child: const Text('counter ValueNotifier')
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ValueListenableBuilder<int>(
                    valueListenable: counterNotifier,
                    builder: (context, value, child) => Text(value.toString())
                  ),
                )
              ],
            ),

            const Divider(),

            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(onPressed: () {
                    final plusOne = array.length + 1;
                    setState(() {
                      array.add(plusOne);
                    });
                  }, child: const Text('array setState')
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(child: Text('$array')),
              ],
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(onPressed: () {
                    final plusOne = arrayNotifier.value.length + 1;
                    arrayNotifier.value = [...arrayNotifier.value, plusOne];

                  }, child: const Text('array ValueNotifier')
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(child: ValueListenableBuilder<List<int>>(
                    valueListenable: arrayNotifier,
                    builder: (context, value, child){
                      return Text('$value');
                    },
                  )
                ),
              ],
            ),

            const Divider(),

            const ExampleNotifier(),

            const Profile(),

          ],
        ),
      ),
    );
  }
}


