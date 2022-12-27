import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx_sm/fluro_router.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  final String title;
  final int value;
  final VoidCallback increase;
  final VoidCallback decrease;

  const HomePage({
    super.key,
    required this.title,
    required this.value,
    required this.increase,
    required this.decrease,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.shopping_cart),
          //   onPressed: () {
          //     MyFluroRouter.router.navigateTo(context, '/cart');
          //   },
          // ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              MyFluroRouter.router.navigateTo(context, '/settings');
            },
          ),
        ],
      ),
      drawer: Container(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                if(Platform.isAndroid) {
                  SystemNavigator.pop();
                } else {
                  exit(0);
                }
              },
              child: Text('Exit'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Center(
              child: Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              heroTag: "btn1",
              onPressed: increase,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              heroTag: "btn2",
              onPressed: decrease,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
