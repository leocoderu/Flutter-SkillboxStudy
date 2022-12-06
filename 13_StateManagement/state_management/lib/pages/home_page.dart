import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:fluro/fluro.dart';
import 'package:state_management/fluro_router.dart';
import 'package:state_management/main.dart';

//import 'package:provider/provider.dart';

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
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              MyFluroRouter.router.navigateTo(context, '/cart');
            },
          ),
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
                onPressed: () {},
                child: Text('Login in'),
            ),
          ],
        ),
      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<AppState>().increment,// {}, //_incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}