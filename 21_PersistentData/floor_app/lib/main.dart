import 'package:floor_app/database.dart';
import 'package:floor_app/entity/person.dart';
import 'package:flutter/material.dart';

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
  AppDatabase? _database;
  List<Person> _persons = [];

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    _database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final personDao = _database!.personDao;
    _persons = await personDao.findAllPersons();

    setState(() {});
  }

  Future<void> _insertPerson(Person person) async {
    await _database!.personDao.insertPerson(person);
    _persons = await _database!.personDao.findAllPersons();
    setState(() {});
  }

  Future<void> _updatePerson(Person person) async {
    //TODO: Update Person
  }

  Future<void> _deletePerson(int id) async {
    //TODO: Delete Person
  }

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void _showForm(BuildContext context, int? idx) async {
    if (idx != null) {
      _database!.personDao.findPersonById(idx).first.then((e) {
        _idController.text = e!.id.toString();
        _nameController.text = e.name;
      });
    }

    if(context.mounted) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => Container(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: MediaQuery.of(ctx).viewInsets.bottom + 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _idController,
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
                  final Person onePerson = Person(
                      id: int.tryParse(_idController.text) ?? 0,
                      name: _nameController.text.trim()
                  );
                  (idx == null) ? _insertPerson(onePerson) : _updatePerson(onePerson);
                  _idController.text = '';
                  _nameController.text = '';
                  Navigator.of(context).pop();
                },
                child: Text(idx == null ? 'Add New' : 'Update'),
              ),
            ],
          ),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Floor Example App'),centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _persons.length,
        itemBuilder: (ctx, idx) {
          final Person p = _persons[idx];
          return ListTile(
            title: Text('${p.id} - ${p.name}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => _showForm(context, p.id),
                  tooltip: 'Edit Person',
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () => _deletePerson(p.id),
                  tooltip: 'Delete Person',
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        tooltip: 'Add Person',
        child: const Icon(Icons.add),
      ),
    );
  }
}
