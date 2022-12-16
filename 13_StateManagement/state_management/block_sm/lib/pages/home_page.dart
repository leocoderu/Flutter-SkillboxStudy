import 'package:flutter/material.dart';

import 'package:block_sm/fluro_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:business_sm/business_sm.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  final String title;

  const HomePage({super.key, required this.title});

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
                BlocBuilder<CounterBloc, int>(
                  builder: (_, state) => Text(
                      state.toString(),
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
                  onPressed: () => context.read<CounterBloc>().add(CounterEvent.increase),
                  //onPressed: context.read<CounterBloc>().increment,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () => context.read<CounterBloc>().add(CounterEvent.decrease),
                  //onPressed: context.read<CounterBloc>().decrement,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ),
            ],
          ),
    );
  }
}