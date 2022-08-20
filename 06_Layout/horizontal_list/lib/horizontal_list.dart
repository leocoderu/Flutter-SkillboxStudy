import 'package:flutter/material.dart';
import 'package:horizontal_list/simple_card.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  final List<Widget> _data = List.generate(9, (index) => SimpleCard(index: index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double width = constraints.constrainWidth();
            return (width > 500)
                ? ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      ..._data.map((item) => item)
                    ],
                  )
                : SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ..._data.map((item) => SizedBox(
                        width: 100,
                        child: item,
                      )).toList(),
                    ],
                  ),
                );
          },
        )
      ),
    );
  }
}
