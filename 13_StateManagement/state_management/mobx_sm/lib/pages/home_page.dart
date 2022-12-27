import 'dart:io';

import 'package:business_sm/business_sm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_sm/fluro_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  final String title;

  const HomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
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
            Observer(
                builder: (context) => Center(
                  child: Text(
                    state.value.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
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
              onPressed: state.increment,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              heroTag: "btn2",
              onPressed: state.decrement,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
