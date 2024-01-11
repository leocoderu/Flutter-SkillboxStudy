import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:model/model.dart';
import 'package:wiki_app/items_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box<Category>? _categoryBox;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(ItemsAdapter());

    Hive.openBox<Category>('category')
        .then((value) => setState(() => _categoryBox = value));
  }

  Future<void> _addRec(Category cat) async =>
      await _categoryBox?.add(cat);

  Future<void> _renameRec(int idx, Category cat) async =>
      await _categoryBox?.putAt(idx, cat);

  Future<void> _deleteRec(int idx) async =>
      await _categoryBox?.deleteAt(idx);

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void _showForm(BuildContext ctx, int? idx) async {
    if (idx != null) {
      final existingItem = _categoryBox!.getAt(idx);
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
                  Category cat = Category(int.tryParse(_idController.text.trim()) ?? 0, _nameController.text.trim());
                  (idx == null) ? _addRec(cat) : _renameRec(idx, cat);
                  _idController.text = '';
                  _nameController.text = '';
                  Navigator.of(context).pop();
                },
                child: Text(idx == null ? 'Create Category' : 'Update Category'),
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
        title: const Text('Wiki'), centerTitle: true,
      ),
      body: Center(
        child: (_categoryBox == null)
          ? const CircularProgressIndicator()
          : ValueListenableBuilder(
            valueListenable: _categoryBox!.listenable(),
            builder: (context, Box<Category> box, widget) {
              return (box.length == 0)
                  ? const Center(child: Text('No categories added to list', style: TextStyle(fontSize: 20.0),))
                  : ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (_, index) {
                        final item = box.values.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute<Widget>(
                                  builder: (BuildContext context) {
                                    return ItemsPage(category: item);
                                  },
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
                                  child: Text('${item.name}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
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
        tooltip: 'Add Category',
        child: const Icon(Icons.add),
      ),
    );
  }
}
