import 'package:flutter/material.dart';

class IntrinsicExample extends StatefulWidget{
  const IntrinsicExample({Key? key}) : super(key: key);
  @override
  State<IntrinsicExample> createState() => _IntrinsicExampleState();
}

class _IntrinsicExampleState extends State<IntrinsicExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intrinsic'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Align(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {},
                  child: const Text('Hi'),
                ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Super long long long text lorem something'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Long long long text'),
              ),
              const Divider(),
              const IntrinsicButtons(),
            ],
          ),
        ),
      )
    );
  }
}

class IntrinsicButtons extends StatelessWidget{
  const IntrinsicButtons({Key? key}) :super (key: key);

  @override
  Widget build(BuildContext context){
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: const Text('Hi'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Super long long long text lorem something'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Long long long text'),
          ),
        ],
      ),
    );
  }
}