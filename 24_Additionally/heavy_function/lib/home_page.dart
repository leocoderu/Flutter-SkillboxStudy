import 'package:flutter/material.dart';

import 'heavy_functions.dart';
import 'triple_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late bool swValue;

  @override
  void initState() {
    swValue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Heavy Function Start'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Start Heavy Function'),
            TripleSwitch(
              id: 'switchSecurity',
              value: swValue,
              timeoutOffOn: 20,
              timeoutOnOff: null,
              actionOffOn: function1(1230000000),
              actionOnOff: null,
              onChanged: (value) => setState(() => swValue = value),
              onResult: (value) {
                debugPrint('Result: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
}
