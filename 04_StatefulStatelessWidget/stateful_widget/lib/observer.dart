import 'package:flutter/material.dart';

class ExampleObserver extends StatefulWidget {
  const ExampleObserver({Key? key}) : super(key: key);
  @override
  State<ExampleObserver> createState() => _ExampleObserverState();
}

class _ExampleObserverState extends State<ExampleObserver> with WidgetsBindingObserver{
  @override
  void initState(){
    super.initState();
    // ignore: avoid_print
    print('INIT STATE');
    WidgetsBinding.instance.addObserver(this);
  }

  // Когда виджет удаляется из дерева виджетов
  @override
  void dispose(){
    super.dispose();
    // ignore: avoid_print
    print('DISPOSE');
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    // AppLifecycleState state might has: detached / inactive / paused / resumed
    if(state == AppLifecycleState.paused){
      // ignore: avoid_print
      print('Приложение переходит в фоновый режим');
    }
    if(state == AppLifecycleState.resumed){
      // ignore: avoid_print
      print('Приложение выходит из фонового режима');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('BUILD');
    return Scaffold(
      appBar: AppBar(
        title: const Text('didChangeAppLifecycleState'),
      ),
      body: const Center(
        child: Text('didChangeAppLifecycleState'),
      ),
    );
  }
}
