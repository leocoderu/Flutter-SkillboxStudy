import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Welcome to Store'),
          ],
        ),
      ),
    );
  }
}
