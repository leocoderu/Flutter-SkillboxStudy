//import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
//import 'package:simple_navigation/fluro_router.dart';
//import 'package:navigation_example/about_page.dart';

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
              //const Text('Navigation'),
              ElevatedButton(
                onPressed: () {
                  //MyFluroRouter.router.navigateTo(context, '/about/333', transition: TransitionType.fadeIn);
                  //Navigator.of(context).pushNamed('/about');
                },
                child: const Text('About'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      '/about/123123123123123',
                      //arguments: {
                      //  'id': 123123123123123,
                      //}
                  );
                },
                child: const Text('About with args'),
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
                child: const Text('Some place'),
              ),
            ],
          )
      ),
    );
  }
}
