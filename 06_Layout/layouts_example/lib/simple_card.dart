import 'package:flutter/material.dart';

class SimpleCard extends StatefulWidget{
  const SimpleCard({Key? key, required this.index}) : super(key: key);
  final String index;

  @override
  State<SimpleCard> createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {
  ScrollController controller = ScrollController();

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {

    });

    // ignore: avoid_print
    print('init ${widget.index}');
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    // ignore: avoid_print
    print('dispose ${widget.index}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: ListTile(
          trailing: Icon(
            Icons.favorite,
            color: isFavorite ? Colors.red : Colors.black12
          ),
          title: Text(widget.index),
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
        ),
      ),
    );
  }
}
