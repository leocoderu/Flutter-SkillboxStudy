import 'package:flutter/material.dart';

//import 'package:fluro/fluro.dart';
//import 'package:firebase_project/fluro_router.dart';

import 'package:firebase_project/pages/auth_page/auth_page.dart';
import 'package:firebase_project/pages/home_page/home_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (_, snapshot) {
          return snapshot.hasData ? HomePage() : AuthPage();
        },
    );
  }
}
