import 'package:flutter/material.dart';

import 'heavy_functions.dart';
import 'heavy_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Isolate Example"),
          centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TripleSwitch(
              function: heavyFunction1,
              arguments: const [100000000],
              onResult: (res) => debugPrint(res.toString()),
            ),
            TripleSwitch(
              function: heavyFunction2,
              arguments: const [100000000, 'Second Func'],
              onResult: (res) => debugPrint(res),
            ),
            TripleSwitch(
              function: heavyFunction3,
              arguments: const [16, 2],
              onResult: (res) => debugPrint(res.toString()),
            ),
            const TripleSwitch(
              function: heavyFunction4,
            ),
          ],
        ),
      ),
    );
  }
}
