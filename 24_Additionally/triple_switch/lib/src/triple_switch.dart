// Import Dart and Flutter
import 'dart:isolate';
import 'package:flutter/material.dart';

// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_switch/src/state/sw_event.dart';

// Import Modules
import 'state/sw_state.dart';
import 'switch_model.dart';
import 'triple_switch_ui.dart';

enum SwitchPosition {on, wait, off}

class TripleSwitch extends StatelessWidget {
  final SwitchPosition? position;
  final int? timeoutOffOn;
  final int? timeoutOnOff;
  final ValueChanged<SwitchPosition>? onChanged;

  const TripleSwitch({super.key, this.position, this.timeoutOffOn, this.timeoutOnOff, this.onChanged});

  //Get Timeout by dependence from direction Off->On / On->Off
  int? timeoutByDirection(SwitchPosition? swp) =>
      (swp == SwitchPosition.on) ? timeoutOnOff : timeoutOffOn;

  @override
  Widget build(BuildContext context) {
    final timerPort = ReceivePort();

    return BlocProvider(
      create: (_) => SwBloc(),
      child: BlocBuilder<SwBloc, SwitchModel>(
          builder: (context, state) {
            return TripleSwitchUI(
              position: state.position ?? position,
              timeout: state.timeout ?? timeoutByDirection(state.position ?? position),
              onChanged: (onChanged != null) ? (value) {
                if (value == SwitchPosition.wait) {
                  context.read<SwBloc>().add(SetPrevious(previousPosition: state.position ?? position));
                  context.read<SwBloc>().add(SetTimeout(timeout: timeoutByDirection(state.position ?? position)));

                  // Запуск обратного отчета таймера
                  Isolate.spawn(startTimer, (timeout: (state.timeout ?? (timeoutByDirection(state.position ?? position) ?? 0)), sendPort: timerPort.sendPort));

                  // timerPort.asBroadcastStream()
                  // timerPort.close();
                  timerPort.listen((time){
                    //print('I have been listen some thing, like: $time');

                    // Send Data to BloC state
                    if (time != null) {
                      context.read<SwBloc>().add(SetTimeout(timeout: time));
                    } else {
                      context.read<SwBloc>().add(SetPosition(switchPosition: state.previous ?? position));
                      //timerPort.close();
                    }
                  });

                  //_initListener(context, state.previous ?? widget.position, timerPort);
                }
                // Set Switcher to new position
                context.read<SwBloc>().add(SetPosition(switchPosition: value));

                // TODO: Запуск Изолята
                onChanged!(value);
              } : null,
            );
          }
      )
    );
  }
}

void startTimer(({int timeout, SendPort sendPort}) data) async {
  for (int i = (data.timeout - 1); i >= 0; --i) {
    await Future.delayed(const Duration(seconds: 1), () => data.sendPort.send(i));
  }
  data.sendPort.send(null);
  //print('isolate finished');
}

// Инверсия позиции тумблера
// switchPosition iPos(switchPosition swPos) =>
//     (swPos == switchPosition.on) ? switchPosition.off : switchPosition.on;
//
// Если Таймер еще идет и получен результат с Изолята, если результат положительный
// Переключаем тумблер дальше, иначе возвращаем в исходную позицию
// if ((timeOut != null) && (resData.exist)) {
//   swPos = resData ? iPos(prePos) : prePos;
// }