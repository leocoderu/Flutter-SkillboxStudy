import 'package:flutter/material.dart';

class ExampleKeys extends StatefulWidget {
  const ExampleKeys({Key? key}) : super(key: key);

  @override
  State<ExampleKeys> createState() => _ExampleKeysState();
}

class _ExampleKeysState extends State<ExampleKeys>{
  final List<String>  nav = ['Список 1', 'Список 2'];
  List<String> fakeData = List.generate(100, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: nav.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Example Keys'),
          bottom: TabBar(
            tabs: nav.map((String item) => Tab(text: item)).toList(),
          ),
        ),
        body: TabBarView(
          children: nav.map((name) {
            return ListView(
              key: PageStorageKey(name), // ValueKey / ObjectKey / UniqueKey / GlobalKeys
              children: <Widget>[
                for (var item in fakeData) Text(item),
              ]
            );
          }
          ).toList(),
        ),
      ),
    );
  }
}