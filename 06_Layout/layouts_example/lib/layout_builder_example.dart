import 'package:flutter/material.dart';
import 'package:layouts_example/simple_card.dart';
//import 'package:layouts_example/utils.dart';

class LayoutBuilderExample extends StatefulWidget{
  const LayoutBuilderExample({Key? key}) : super(key: key);
  @override
  State<LayoutBuilderExample> createState() => _LayoutBuilderExampleState();
}

class _LayoutBuilderExampleState extends State<LayoutBuilderExample> {
  final List<Widget> _data = List.generate(100, (index) => SimpleCard(index: index.toString()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Builder'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(
              labelText: 'Search',
            ),
          ),
          Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double width = constraints.constrainWidth();
                  return width > 600
                    ? GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: width > 600 ? 3 : 2,
                            childAspectRatio: width > 600 ? 2 : 1,
                          ),
                      itemCount: _data.length,
                    itemBuilder: (context, index) => _data[index],
                      )
                    : ListView.builder(
                        itemCount: _data.length,
                        itemBuilder: (context, index) => _data[index],
                      );
                },
              )
          )
        ],
      ),
    );
  }
}