import 'dart:isolate';

import 'package:flutter/material.dart';

class TripleSwitch extends StatelessWidget {

  final String id;
  final bool value;
  final int? timeoutOffOn;
  final int? timeoutOnOff;
  final Function actionOffOn;
  final dynamic actionOnOff;
  final ValueChanged<bool>? onChanged;
  final ValueChanged<dynamic> onResult;

  const TripleSwitch({super.key,
    required this.id,
    required this.value,
    this.timeoutOffOn,
    this.timeoutOnOff,
    required this.actionOffOn,
    required this.actionOnOff,
    this.onChanged,
    required this.onResult,
  });

  _runTask() {
    final port = ReceivePort();
    Isolate.spawn(isoFunc, (sendPort: port.sendPort, func: actionOffOn));

    port.listen((value) {
      onResult(value);
      port.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _runTask,
          child: const Text('Запустить задачу'),
        ),
        //SizedBox(height: 20),
        //Text(_result),
      ],
    );
  }
}

void isoFunc(({SendPort sendPort, Function func}) args) {
  final res = args.func();
  args.sendPort.send(res);
}

