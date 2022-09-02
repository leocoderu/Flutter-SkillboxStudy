import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_navigation/pages/profile_views_detail.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Profile View'),
              ElevatedButton(
                child: const Text('Go to Detail Page'),
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (BuildContext context) => const ProfileDetail()
                  ));
                },
              )
            ],
          ),
        )
    );
  }
}






