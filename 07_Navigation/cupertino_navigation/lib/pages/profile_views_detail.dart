import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_navigation/pages/profile_views_nested.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.lime,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Profile View Detail'),
              ElevatedButton(
                child: const Text('Go to Nested Page'),
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (BuildContext context) => const ProfileViewNested()
                  ));
                },
              )
            ],
          ),
        )
    );
  }
}