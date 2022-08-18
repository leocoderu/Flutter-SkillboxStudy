import 'package:flutter/material.dart';
import 'package:layouts_example/simple_card.dart';

class KeepAliveExample extends StatefulWidget{
  const KeepAliveExample({Key? key}) : super(key: key);

  @override
  State<KeepAliveExample> createState() => _KeepAliveExampleState();
}

class _KeepAliveExampleState extends State<KeepAliveExample> with AutomaticKeepAliveClientMixin {
  List<Widget> data = List.generate(100, (index) => SimpleCard(index: index.toString()));

 //ScrollController controller = ScrollController(initialScrollOffset: 0);
  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print('INIT STATE');
  }

  @override
  void dispose() {
    super.dispose();
    // ignore: avoid_print
    print('DISPOSE');
  }

  @override
  Widget build(BuildContext context){
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView KeepAlive'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ...data.map((e) => e).toList(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}