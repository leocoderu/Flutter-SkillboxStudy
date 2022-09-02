import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewNested extends StatelessWidget {
  const HomeViewNested({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Home View Nested'),
            ],
          ),
        )
    );
  }
}