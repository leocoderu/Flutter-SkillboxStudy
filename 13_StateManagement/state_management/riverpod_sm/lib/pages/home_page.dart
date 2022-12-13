import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_sm/app_state.dart';
import 'package:riverpod_sm/fluro_router.dart';


class HomePage extends ConsumerWidget {
  static const routeName = '/';
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(countProvider);
    final provider = ref.watch(countProvider.notifier);
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
          //         onPressed: () {},
          //         child: Text('Login in'),
          //       ),
          //     ],
          //   ),
          // ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Text(
                  counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
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
                  onPressed: provider.increment,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: provider.decrement,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ),
            ],
          ),
        );
  }
}