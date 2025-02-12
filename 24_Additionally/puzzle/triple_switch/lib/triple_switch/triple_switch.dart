import 'package:flutter/material.dart';

import 'switcher_state.dart';

class TripleSwitch extends StatelessWidget {

  final String id;
  final bool value;
  final int? timeoutOffOn;
  final int? timeoutOnOff;
  final Function? actionOffOn;
  final Function? actionOnOff;
  final List<dynamic>? argumentsOffOn;
  final List<dynamic>? argumentsOnOff;
  final ValueChanged<bool>? onChanged;
  final ValueChanged<dynamic>? onResult;

  const TripleSwitch({
    super.key,
    required this.id,
    required this.value,
    this.timeoutOffOn,
    this.timeoutOnOff,
    this.argumentsOffOn,
    this.actionOffOn,
    this.actionOnOff,
    this.argumentsOnOff,
    this.onChanged,
    this.onResult,
  });

  @override
  Widget build(BuildContext context) {
    final SwitchState switchers = SwitchState();

    return GestureDetector(
      onTap: () {
        (switchers.data[id]!.timeout == null)
          ? switchers.start(id, timeoutOffOn, value ? actionOnOff : actionOffOn, value ? (argumentsOnOff ?? []) : (argumentsOffOn ?? []))
          : switchers.stop(id);
      },
      child: ListenableBuilder(
        listenable: switchers,
        builder: (BuildContext ctx, child) {
          if ((onResult != null) && (switchers.data[id]!.result != null)) {
            onResult!(switchers.data[id]!.result);
          }
          return Container(
            color: switchers.data[id]!.timeout != null ? Colors.grey : Colors.indigo,
            width: 200,
            height: 100,
            child: Center(
              child: Text('${switchers.data[id]!.timeout == null ? 'Tap me!' : switchers.data[id]!.timeout!}')
            ),
          );
        }
      ),
    );
  }
}
