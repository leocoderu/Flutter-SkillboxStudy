import 'package:flutter/material.dart';
import 'package:hive_app/person.dart';
import 'package:hive_flutter/adapters.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  Box<Person>? _personBox;

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

  void _initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PersonAdapter());

    Hive.openBox<Person>('person').then((value) {
      setState(() => _personBox = value);
    });
  }

  Future<void> _addRec(String name, int age) async =>
    await _personBox?.add(Person(name, age));

  Future<void> _renameRec(int idx, Person person) async =>
    await _personBox!.putAt(idx, person);

  Future<void> _deleteRec(int idx) async =>
    await _personBox!.deleteAt(idx);

  void _showForm(BuildContext ctx, int? idx) async {
    if (idx != null) {
      final existingItem = _personBox!.getAt(idx);
      _nameController.text = existingItem!.name;
      _ageController.text = existingItem.age.toString();
    }

    showModalBottomSheet(
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
            const SizedBox(height: 10.0),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Age'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                (idx == null) ? _addRec(_nameController.text, int.parse(_ageController.text))
                : _renameRec(idx, Person(_nameController.text.trim(), int.parse(_ageController.text.trim())));
                _nameController.text = '';
                _ageController.text = '';
                Navigator.of(context).pop();
              },
              child: Text(idx == null ? 'Create New' : 'Update'),
            ),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Hive CRUD Demo Project'),
        centerTitle: true,
      ),
      body: Center(
        child: (_personBox == null)
        ? const Center(child: CircularProgressIndicator())
        : ValueListenableBuilder(
            valueListenable: _personBox!.listenable(),
            builder: (context, Box<Person> box, widget) {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (_, index) {
                  final item = box.values.elementAt(index);
                  return  ListTile(
                      title: Center(child: Text('${item.name} - (${item.age})')),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => _showForm(context, index),
                            tooltip: 'Rename',
                            icon: const Icon(Icons.edit),
                          ),
                          const SizedBox(width: 5.0),
                          IconButton(
                            onPressed: () => _deleteRec(index),
                            tooltip: 'Delete',
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      )
                  );
                },
              );
            }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        tooltip: 'Add Person',
        child: const Icon(Icons.add),
      ),
    );
  }
}
