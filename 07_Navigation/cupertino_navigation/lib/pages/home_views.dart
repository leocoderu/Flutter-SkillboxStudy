import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_navigation/pages/home_views_detail.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.lightGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Home View'),
              ElevatedButton(
                  child: const Text('Go to Detail Page'),
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) => const HomeViewDetail()
                    ));
                  },
              )
            ],
          ),
        )
    );
  }
}