import 'package:drift_app/drift/drift.dart';
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
  late MyDatabase _database;
  //List<Person> _persons = [];

  @override
  void initState() {
    super.initState();
    _database = MyDatabase();
  }

  Future<void> _addTodo(Todo todo) async {
    await _database.insertTodo(todo);
  }

  //TODO: Get Todo by ID
  //TODO: Update Todo
  //TODO: Delete Todo

  // Future<void> _initDatabase() async {
  //   _database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //
  //   final personDao = _database!.personDao;
  //   _persons = await personDao.findAllPersons();
  //
  //   setState(() {});
  // }

  // Future<void> _insertPerson(Person person) async {
  //   await _database!.personDao.insertPerson(person);
  //   _persons = await _database!.personDao.findAllPersons();
  //   setState(() {});
  // }
  //
  // Future<void> _updatePerson(Person person) async {
  //   //TODO: Update Person
  // }
  //
  // Future<void> _deletePerson(int id) async {
  //   //TODO: Delete Person
  // }

  // final TextEditingController _idController = TextEditingController();
  // final TextEditingController _nameController = TextEditingController();
  //
  // void _showForm(BuildContext context, int? idx) async {
  //   if (idx != null) {
  //     _database!.personDao.findPersonById(idx).first.then((e) {
  //       _idController.text = e!.id.toString();
  //       _nameController.text = e.name;
  //     });
  //   }
  //
  //   if(context.mounted) {
  //     showModalBottomSheet(
  //         context: context,
  //         isScrollControlled: true,
  //         builder: (ctx) => Container(
  //           padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: MediaQuery.of(ctx).viewInsets.bottom + 10),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             children: [
  //               TextField(
  //                 controller: _idController,
  //                 decoration: const InputDecoration(hintText: 'ID'),
  //               ),
  //               const SizedBox(height: 10.0),
  //               TextField(
  //                 controller: _nameController,
  //                 decoration: const InputDecoration(hintText: 'Name'),
  //               ),
  //               const SizedBox(height: 20.0),
  //               ElevatedButton(
  //                 onPressed: () async {
  //                   // final Person onePerson = Person(
  //                   //     id: int.tryParse(_idController.text) ?? 0,
  //                   //     name: _nameController.text.trim()
  //                   // );
  //                   // (idx == null) ? _insertPerson(onePerson) : _updatePerson(onePerson);
  //                   _idController.text = '';
  //                   _nameController.text = '';
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text(idx == null ? 'Add New' : 'Update'),
  //               ),
  //             ],
  //           ),
  //         )
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Floor Example App'),centerTitle: true,
      ),
      body: StreamBuilder<List<Todo>>(
        stream: _database.todosStream,
        initialData: const [],
        builder: (context, todo) {
          return ListView.builder(
              itemCount: todo.data!.length,
              itemBuilder: (ctx, idx) {
                final Todo p = todo.data![idx];
                return ListTile(
                  title: Text('${p.id} - ${p.title}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        tooltip: 'Edit Person',
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {},
                        tooltip: 'Delete Person',
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTodo(const Todo(id: 2, title: 'Some thing else', content: 'Some')),
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// инсерт... капец тютор!!!