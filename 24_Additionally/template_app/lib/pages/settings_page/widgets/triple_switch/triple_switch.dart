import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:template_app/pages/settings_page/widgets/triple_switch/triple_switch_ui.dart';

class TripleSwitch extends StatefulWidget {
  const TripleSwitch({super.key, required this.swPos, this.timeOut});

  final switchPosition swPos;
  final int? timeOut;

  @override
  State<TripleSwitch> createState() => _TripleSwitchState();
}

class _TripleSwitchState extends State<TripleSwitch> {
  final receivePort = ReceivePort();
  Timer? timer;

  // states
  int? timeOut;               // Timer of timeout
  late switchPosition swPos;  // Current switch position
  late switchPosition prePos; // For save switch position before change to wait

  void _initListener() {
    receivePort.listen((data) {
      //setState(() {
        //_weather = data;
      //});
    });
  }

  void tick() {
    setState(() {
      if (timeOut != null) {
        timeOut = timeOut! - 1;
        if (timeOut! < 0) timeOut = null;
      }
    });
  }

  @override
  void initState() {
    timeOut = widget.timeOut;
    prePos = swPos = widget.swPos;

    _initListener();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => tick());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {


    // Инверсия позиции тумблера
    // switchPosition iPos(switchPosition swPos) =>
    //     (swPos == switchPosition.on) ? switchPosition.off : switchPosition.on;
    //
    // Если Таймер еще идет и получен результат с Изолята, если результат положительный
    // Переключаем тумблер дальше, иначе возвращаем в исходную позицию
    // if ((timeOut != null) && (resData.exist)) {
    //   swPos = resData ? iPos(prePos) : prePos;
    // }


    return TripleSwitchUI(
      value: swPos,
      timeout: timeOut,
      onChanged: (value) {
        //onChanged(value);
        if (value == switchPosition.wait) {
          setState(() => prePos = swPos);
          // Запуск обратного отчета таймера
        }
        setState(() => swPos = value);
        // Запуск Изолята
      },
    );
  }
}
