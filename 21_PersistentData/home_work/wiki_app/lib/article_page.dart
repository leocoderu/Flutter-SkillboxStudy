import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:model/model.dart';

class ArticlePage extends StatefulWidget {
  final int index;
  final Items items;
  const ArticlePage({super.key, required this.index, required this.items});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late InAppWebViewController _webViewController;
  Box<Items>? _itemsBox;
  late String url;

  @override
  void initState() {
    super.initState();
    url = widget.items.article ?? '';
    _initHive();
  }

  Future<void> _initHive() async =>
      await Hive.openBox<Items>('items_${widget.items.category}').then((value) => setState(() => _itemsBox = value));

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      javaScriptCanOpenWindowsAutomatically: true,
      supportZoom: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  final TextEditingController _nameController = TextEditingController();
  void _showForm(BuildContext ctx) async {
    _nameController.text = url;

    showModalBottomSheet<Widget>(
      context: ctx,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                String oldUrl = url;
                setState(() {
                  url = _nameController.text.trim();
                  Items newItem = Items(widget.items.id, widget.items.name, widget.items.category, url);
                  _itemsBox!.putAt(widget.index, newItem);
                });
                if(oldUrl != '') _webViewController.loadUrl(urlRequest: URLRequest(url: Uri.parse(url)));
                Navigator.of(context).pop();
              },
              child: Text(url == '' ? 'Add Article' : 'Update Article'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //String someText='# **Charlotte Hope** \n '
    //    '![Photo Sharlotte](https://i.pinimg.com/736x/f8/20/60/f820602379345b261428d64a1414c107--british-actresses-beautiful-people.jpg)'
    //    'is an English actress.\n '
    //    'She first achieved recognition for her recurring role as Myranda in the third through fifth seasons of the HBO fantasy series Game of Thrones (2013–2016). Hope gained further prominence in the lead role of Catherine of Aragon on the Starz historical drama series The Spanish Princess (2019–2020), her first starring performance. In 2020, she appeared as a series regular on the second season of the ITV thriller Bancroft and the Netflix biographical drama The English Game. Outside television, Hope has appeared in the biographic romance film The Theory of Everything (2014) and the horror film The Nun (2018). She also voiced one of the playable characters in the action-adventure video game We Happy Few (2018). She stars as Sandra in the upcoming British gangster biopic The Chelsea Cowboy (2023).# __My Favorite actress!__ \n ';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.items.name), centerTitle: true,
      ),
      body: Center(
        child: (url == '')
          ? Text('No information!')
          : InAppWebView(
              onWebViewCreated: (controller) => _webViewController = controller,
              initialOptions: options,
              initialUrlRequest: URLRequest(url: Uri.parse(url)),
              //initialUrlRequest: URLRequest(url: Uri.parse('https://en.wikipedia.org/wiki/Charlotte_Hope')),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context),
        tooltip: 'Add Item',
        child: const Icon(Icons.edit),
      ),
    );
  }
}

