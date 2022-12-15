import 'package:flutter/material.dart';

import 'package:block_sm/fluro_router.dart';
import 'package:business_sm/business_sm.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  final String title;

  const HomePage({super.key, required this.title});

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CounterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CounterBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
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
                StreamBuilder(
                  stream: bloc.state,
                  builder: (_, snapshot) {
                    return Text(
                      snapshot.data?.toString() ?? '',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
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
                  onPressed: () => bloc.action.add(CounterEvent.increase),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () => bloc.action.add(CounterEvent.decrease),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ),
            ],
          ),
        );
  }
}