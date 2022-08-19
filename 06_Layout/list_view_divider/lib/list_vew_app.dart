import 'package:flutter/material.dart';
import 'package:list_view_divider/simple_card.dart';

class ListViewDivider extends StatefulWidget {
  const ListViewDivider({Key? key}) : super(key: key);

  @override
  State<ListViewDivider> createState() => _ListViewDividerState();
}

class _ListViewDividerState extends State<ListViewDivider> {
  final List<Widget> _dataObj = List.generate(100, (index) => SimpleCard(index: index.toString()));
  final List<String> _data = List.generate(100, (index) => '$index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Divider App'),
        centerTitle: true,
      ),
      body: Center(

        // Option #1
        child: ListView(
          children: <Widget>[
            ..._dataObj.map((e) => e),
          ],
        ),

        //Option #2
        // child: ListView.separated(
        //     itemCount: _data.length,
        //     itemBuilder: (context, index) {
        //       return Text(
        //         _data[index],
        //       );
        //     },
        //     separatorBuilder: (context, index) {
        //       return const Divider();
        //     }
        // ),


      ),
    );
  }
}
