import 'package:flutter/material.dart';

class GestureExample extends StatefulWidget{
  const GestureExample({Key? key}) : super(key: key);
  @override
  State<GestureExample> createState() => _GestureExampleState();
}

class _GestureExampleState extends State<GestureExample> {

  List<Widget> data = List.generate(20, (index) {
    return Card(
      color: Colors.green[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(20),
            child: Text(index.toString()),
          )
        ],
      ),
    );
  });

  double trans = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails value) {
                debugPrint(value.globalPosition.dx.toString());
                setState(() {
                  trans = value.globalPosition.dx;
                });
              },
              child: Container(
                height: 400,
                color: Colors.green[100],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, trans, 0),
              height: 100,
              color: Colors.red[200],
            ),
            GestureDetector(
              onTap: () {
                debugPrint('ON TAP');
              },
              child: const Text('Something text'),
            )
          ],
        ),
      )
    );
  }
}