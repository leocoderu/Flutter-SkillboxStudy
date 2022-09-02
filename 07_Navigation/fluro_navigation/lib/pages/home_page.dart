import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluro_navigation/fluro_router.dart';

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
                child: const Text('About'),
                onPressed: () {
                  MyFluroRouter.router.navigateTo(context, '/about', transition: TransitionType.fadeIn);
                  //Navigator.of(context).pushNamed('/about');
                },
              ),
              ElevatedButton(
                child: const Text('About with args'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/about/123123123123123');
                },
              ),
              ElevatedButton(
                child: const Text('Blog'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/blog');
                },
              ),
              ElevatedButton(
                child: const Text('Some place'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/unknown_page');
                },
              ),
            ],
          )
      ),
    );
  }
}
