import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileViewNested extends StatelessWidget {
  const ProfileViewNested({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.purpleAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Profile View Nested'),
            ],
          ),
        )
    );
  }
}