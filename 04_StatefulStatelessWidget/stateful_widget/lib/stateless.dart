import 'package:flutter/material.dart';
import 'package:stateful_widget/user_card.dart';

class ExampleStateless extends StatefulWidget {
  const ExampleStateless({Key? key}) : super(key: key);

  @override
  State<ExampleStateless> createState() =>_ExampleStatelessState();
}

class _ExampleStatelessState extends State<ExampleStateless> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Stateless Widget'),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            UserCard(name: 'Ann', age: 25),
            UserCard(name: 'Mike', age: 22),
            UserCard(name: 'Tom', age: 20),
          ],
        ),
      ),
    );
  }
}

