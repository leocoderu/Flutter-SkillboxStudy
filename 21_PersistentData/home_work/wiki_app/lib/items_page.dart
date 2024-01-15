import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:model/model.dart';
import 'package:wiki_app/article_page.dart';

class ItemsPage extends StatefulWidget {
  final Category category;
  const ItemsPage({super.key, required this.category});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  Box<Items>? _itemsBox;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async =>
    await Hive.openBox<Items>('items_${widget.category.id}').then((value) => setState(() => _itemsBox = value));

  int _getMaxID() => (_itemsBox?.values != null && _itemsBox!.values.length > 0) ? _itemsBox!.values.last.id : 0;

  Future<void> _addRec(Items item) async => await _itemsBox?.add(item);

  Future<void> _renameRec(int idx, Items item) async => await _itemsBox?.putAt(idx, item);

  Future<void> _deleteRec(int idx) async => await _itemsBox?.deleteAt(idx);

  final TextEditingController _nameController = TextEditingController();

  void _showForm(BuildContext ctx, int? idx) async {
    if (idx != null) {
      final existingItem = _itemsBox!.getAt(idx);
      _nameController.text = existingItem!.name;
    } else {
      _nameController.text = '';
    }

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
                int idEl = (idx != null) ? _itemsBox!.values.elementAt(idx).id : _getMaxID() + 1;
                Items newItem = Items(idEl, _nameController.text.trim(), widget.category.id);
                (idx == null) ? _addRec(newItem) : _renameRec(idx, newItem);
                Navigator.of(context).pop();
              },
              child: Text(idx == null ? 'Create Item' : 'Update Item'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.category.name), centerTitle: true,
      ),
      body: Center(
        child: (_itemsBox == null)
        ? const CircularProgressIndicator()
        : ValueListenableBuilder(
            valueListenable: _itemsBox!.listenable(),
            builder: (context, Box<Items> box, wid) {
              return (_itemsBox!.length == 0)
          ? const Center(child: Text('No items added to the category', style: TextStyle(fontSize: 20.0),))
          : ListView.builder(
              itemCount: _itemsBox!.length,
              itemBuilder: (_, index) {
                final item = _itemsBox!.values.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<Widget>(
                        builder: (BuildContext context) => ArticlePage(items: item),
                      ),
                    );
                  },
                  //onLongPress: () {},
                  child: Slidable(
                    key: UniqueKey(),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: 0.25,
                      children: [
                        IconButton(
                          onPressed: () => _showForm(context, index),
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () => _deleteRec(index),
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: Center(
                          child: Text('${item.id} - ${item.name} - ${item.category}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
