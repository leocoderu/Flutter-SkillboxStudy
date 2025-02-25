import 'package:flutter/material.dart';

import 'switch_state.dart';

class TripleSwitch extends StatelessWidget {

  final String id;                        // Unique ID of switch
  //final bool value;                       // Default value of switch, true - On / false - Off
  final int? timeoutOffOn;                // Timeout for wait switching Off -> On
  final int? timeoutOnOff;                // Timeout for wait switching On -> Off
  final Function? functionOffOn;          // Calling a heavy function during switching Off -> On
  final Function? functionOnOff;          // Calling a heavy function during switching On -> Off
  final List<dynamic>? argumentsOffOn;    // Arguments of the called heavy function, Off -> On
  final List<dynamic>? argumentsOnOff;    // Arguments of the called heavy function, On -> Off
  //final ValueChanged<bool>? onChanged;    // Event returns new position of switch, it may be old or new position

  const TripleSwitch({
    super.key,
    required this.id,
    //required this.value,
    this.timeoutOffOn,
    this.timeoutOnOff,
    this.argumentsOffOn,
    this.functionOffOn,
    this.functionOnOff,
    this.argumentsOnOff,
    //this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final SwitchState switches = SwitchState();

    return ListenableBuilder(
      listenable: switches,
      builder: (BuildContext ctx, child) {
        return GestureDetector(
          onTap: () {
            if(switches.data[id]!.timeout == null) { // preventing a restart
              switches.start(id,
                switches.data[id]!.position ? timeoutOnOff : timeoutOffOn,
                switches.data[id]!.position ? functionOnOff : functionOffOn,
                switches.data[id]!.position ? argumentsOnOff : argumentsOffOn
              );
            }
            //: null; //switches.stop(id);        // Нет смысла останавливать запрос, т.к. он д/б отработан
          },
          child: Container(
            color: (switches.data[id]!.timeout != null)
              ? Colors.grey
              : (switches.data[id]!.position ? Colors.green : Colors.red) ,
            width: 200,
            height: 100,
            child: Center(
              child: Text('${switches.data[id]!.timeout == null ? 'Tap me!' : switches.data[id]!.timeout!}')
            ),
          ),
        );
      }
    );
  }
}
