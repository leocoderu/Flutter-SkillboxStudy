import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SimpleCard extends StatefulWidget{
  const SimpleCard({Key? key, required this.index}) : super(key: key);
  final String index;

  @override
  State<SimpleCard> createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard>
    with AutomaticKeepAliveClientMixin {    /// Using the mixin
  bool isFavorite = false;

  final wordPair = WordPair.random();       // Генерируем пару Фамилия Имя

  // Событие по нажатию на карточку
  cardOnTap(){
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);            /// Calling build method of mixin
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: ListTile(
          trailing: Icon(
            Icons.favorite,
            color: isFavorite ? Colors.red : Colors.black12
          ),
          title: Text(
              wordPair.asPascalCase,
          ),
          onTap: () {cardOnTap();},
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;    /// Overriding the value to preserve the state
}
