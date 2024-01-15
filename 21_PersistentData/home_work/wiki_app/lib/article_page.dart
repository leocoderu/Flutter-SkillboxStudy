import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:model/model.dart';

class ArticlePage extends StatefulWidget {
  final Items items;
  const ArticlePage({super.key, required this.items});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {


  final TextEditingController _nameController = TextEditingController();
  // void _showForm(BuildContext ctx) async {
  //   if (items.article != null) {
  //     _nameController.text = items!.article.name;
  //   } else {
  //     _nameController.text = '';
  //   }
  //
  //   showModalBottomSheet<Widget>(
  //     context: ctx,
  //     isScrollControlled: true,
  //     builder: (context) => Container(
  //       padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: MediaQuery.of(context).viewInsets.bottom + 10),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: [
  //           TextField(
  //             controller: _nameController,
  //             decoration: const InputDecoration(hintText: 'Name'),
  //           ),
  //           const SizedBox(height: 20.0),
  //           ElevatedButton(
  //             onPressed: () async {
  //               int idEl = (idx != null) ? _itemsBox!.values.elementAt(idx).id : _getMaxID() + 1;
  //               Items newItem = Items(idEl, _nameController.text.trim(), widget.category.id);
  //               (idx == null) ? _addRec(newItem) : _renameRec(idx, newItem);
  //               Navigator.of(context).pop();
  //             },
  //             child: Text(idx == null ? 'Add Article' : 'Update Article'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
//
  @override
  Widget build(BuildContext context) {
    String someText='# **Charlotte Hope** \n '
        '![Photo Sharlotte](https://i.pinimg.com/736x/f8/20/60/f820602379345b261428d64a1414c107--british-actresses-beautiful-people.jpg)'
        'is an English actress.\n '
        'She first achieved recognition for her recurring role as Myranda in the third through fifth seasons of the HBO fantasy series Game of Thrones (2013–2016). Hope gained further prominence in the lead role of Catherine of Aragon on the Starz historical drama series The Spanish Princess (2019–2020), her first starring performance. In 2020, she appeared as a series regular on the second season of the ITV thriller Bancroft and the Netflix biographical drama The English Game. Outside television, Hope has appeared in the biographic romance film The Theory of Everything (2014) and the horror film The Nun (2018). She also voiced one of the playable characters in the action-adventure video game We Happy Few (2018). She stars as Sandra in the upcoming British gangster biopic The Chelsea Cowboy (2023).# __My Favorite actress!__ \n ';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.items.name), centerTitle: true,
      ),
      body: Center(
        child: Markdown(
          data: someText, // widget.items.article ?? '',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, //=> _showForm(context, null),
        tooltip: 'Add Item',
        child: const Icon(Icons.edit),
      ),
    );
  }
}

