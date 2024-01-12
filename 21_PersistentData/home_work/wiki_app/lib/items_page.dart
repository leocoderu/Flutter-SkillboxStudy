import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:model/model.dart';

class ItemsPage extends StatefulWidget {
  final Category category;
  const ItemsPage({super.key, required this.category});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  Box<Items>? _itemsBox;
  List<Items>? _list;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    await Hive.openBox<Items>('items').then((value) => setState(() => _itemsBox = value));
    if (_itemsBox != null) {
      setState(() {
        _list = _itemsBox!.values.where((e) => (e.category == widget.category.id)).toList();
      });
    }
  }

  Future<void> _addRec(Items item) async {
    await _itemsBox?.add(item);
    setState(() {
      _list!.add(item);
    });
  }

  Future<void> _renameRec(int idx, Items item) async =>
      await _itemsBox?.putAt(idx, item);

  Future<void> _deleteRec(int idx) async =>
      await _itemsBox?.deleteAt(idx);

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void _showForm(BuildContext ctx, int? idx) async {
    if (idx != null) {
      final existingItem = _itemsBox!.getAt(idx);
      _idController.text = existingItem!.id.toString();
      _nameController.text = existingItem.name;
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
              controller: _idController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'ID'),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                Items newItem = Items(int.tryParse(_idController.text.trim()) ?? 0, _nameController.text.trim(), widget.category.id);
                (idx == null) ? _addRec(newItem) : _renameRec(idx, newItem);
                _idController.text = '';
                _nameController.text = '';
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
    // if (_list != null) {
    //   print('_list = ${_list!.length}');
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.category.name),
        centerTitle: true,
      ),
      body: Center(
        child: (_list == null)
        //child: (_itemsBox == null)
        ? const CircularProgressIndicator()
        : (_list!.length == 0)
        //: (_itemsBox == 0) //(_list!.length == 0)
          ? const Center(child: Text('No items added to the category', style: TextStyle(fontSize: 20.0),))
          : ListView.builder(
              itemCount: _list!.length,
              //itemCount: _itemsBox!.length,
              itemBuilder: (_, index) {
                final item = _list!.elementAt(index);
                //print(item.name);
                //final item = _itemsBox!.values.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute<Widget>(
                    //     builder: (BuildContext context) {
                    //       return ItemsPage(category: item);
                    //     },
                    //   ),
                    // );
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
            ),
          //},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
