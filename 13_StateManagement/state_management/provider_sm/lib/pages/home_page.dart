import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_sm/app_state.dart';
import 'package:provider_sm/fluro_router.dart';


class HomePage extends StatelessWidget {
  static const routeName = '/';
  const HomePage({super.key, required this.title});

  final String title;

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
      // drawer: Container(
      //   child: ListView(
      //     children: [
      //       ElevatedButton(
      //           onPressed: () {},
      //           child: Text('Login in'),
      //       ),
      //     ],
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Consumer<AppState>(
                builder: (context, state, child) => Text(
                  state.counter.toString(),
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
                onPressed: context.read<AppState>().increment,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton(
                heroTag: "btn2",
                onPressed: context.read<AppState>().decrement,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
          ),
        ],
      ),
    );
  }
}