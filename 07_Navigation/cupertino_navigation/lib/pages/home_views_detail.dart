import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_navigation/pages/home_views_nested.dart';

class HomeViewDetail extends StatelessWidget {
  const HomeViewDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.orange,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Home View Detail'),
              ElevatedButton(
                child: const Text('Go to Nested Page'),
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (BuildContext context) => const HomeViewNested()
                  ));
                },
              )
            ],
          ),
        )
    );
  }
}