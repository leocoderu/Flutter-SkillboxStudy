import 'package:flutter/material.dart';
import 'package:function_di/business_layer/func_controller.dart';
import 'package:function_di/business_layer/locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Function throw DI'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Tap to Start func and look to the terminal'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => locator.get<FuncController>().runFunc(),
        tooltip: 'Start',
        child: const Icon(Icons.add),
      ),
    );
  }
}