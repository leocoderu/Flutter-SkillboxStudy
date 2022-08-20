import 'package:flutter/material.dart';

class SimpleCard extends StatefulWidget{
  const SimpleCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<SimpleCard> createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {    /// Using the mixin
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.green[100 + (widget.index * 100)],
          height: 80,
        ),
    );
  }
}
