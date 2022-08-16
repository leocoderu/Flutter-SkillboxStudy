import 'package:flutter/material.dart';

class ExampleNotifier extends StatelessWidget{
  const ExampleNotifier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final ValueNotifier<List<int>> array = ValueNotifier<List<int>>([]);
    // ignore: avoid_print
    print('BUILD EXAMPLE NOTIFIER');
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(onPressed: () {
            array.value = [...array.value, array.value.length + 1];
          }, child: const Text('StatelessWidget ValueNotifier')
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
            child: ValueListenableBuilder<List<int>>(
                valueListenable: array,
                builder: (context, value, child) => Text('$value'))
        ),
      ],
    );
  }
}
