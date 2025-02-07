import 'dart:isolate';

import 'package:flutter/material.dart';

class TripleSwitch extends StatelessWidget {

  final String id;
  final bool value;
  final int? timeoutOffOn;
  final int? timeoutOnOff;
  final dynamic actionOffOn;
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ReceivePort port = ReceivePort();
        Isolate.spawn(isoFunc, (func: actionOffOn, sendPort: port.sendPort));
        port.listen((value) {
          onResult(value);
          port.close();
        });
      },
      child: Container(
        color: Colors.indigo,
        width: 200,
        height: 100,
        child: const Text('Tap me!'),
      ),
    );
  }
}

void isoFunc(({dynamic func, SendPort sendPort}) data) {
  dynamic res = data.func;
  data.sendPort.send(res);
}
