import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/about');
                },
                child: const Text('About'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/blog');
                },
                child: const Text('Blog'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/bbsika');
                },
                child: const Text('Some another place'),
              ),
            ],
          )
      ),
    );
  }
}
