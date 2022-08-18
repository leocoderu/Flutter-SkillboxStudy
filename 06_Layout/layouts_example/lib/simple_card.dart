import 'package:flutter/material.dart';

class SimpleCard extends StatefulWidget{
  const SimpleCard({Key? key, required this.index}) : super(key: key);
  final String index;

  @override
  State<SimpleCard> createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard>
    with AutomaticKeepAliveClientMixin {    /// Using the mixin
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print('init ${widget.index}');
  }

  @override
  void dispose() {
    super.dispose();
    // ignore: avoid_print
    print('dispose ${widget.index}');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);    /// Calling build method of mixin
    return SizedBox(
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

  @override
  bool get wantKeepAlive => true;    /// Overriding the value to preserve the state
}
