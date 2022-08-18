import 'package:flutter/material.dart';

class AspectExample extends StatefulWidget{
  const AspectExample({Key? key}) : super(key: key);
  @override
  State<AspectExample> createState() => _AspectExampleState();
}

class _AspectExampleState extends State<AspectExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: 1.2,
          child: Container(
           color: Colors.blue,
          ),
        ),
      ),
    );
  }
}