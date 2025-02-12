import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';

class TripleSwitch extends StatefulWidget {
  final Function function;
  final List<dynamic>? arguments;
  final ValueChanged<dynamic>? onResult;

  const TripleSwitch({super.key, required this.function, this.arguments, this.onResult});

  @override
  State<TripleSwitch> createState() => _TripleSwitchState();
}

class _TripleSwitchState extends State<TripleSwitch> {

  String _result = "Результат появится здесь";

  Future<void> _runHeavyFunction() async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_isoFunction, [receivePort.sendPort, widget.function, widget.arguments ?? []]);

    receivePort.listen((data) {
      setState(() => _result = data.toString());
      if (widget.onResult != null) widget.onResult!(data);
      receivePort.close();
    });
  }

  static Future<void> _isoFunction(List<dynamic> args) async {

    final SendPort sendPort = args[0];
    final Function func = args[1];
    final List<dynamic> arguments = args[2];


    final result = await func(arguments);
    sendPort.send(result);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_result),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _runHeavyFunction,
          child: const Text("Запустить тяжелую функцию"),
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }
}
