import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_lite_app/dog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

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
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  Database? db;

  @override
  void initState() {
    super.initState();
    _initDB();
  }

  Future<void> _initDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'dogs.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );

    setState(() {});
  }
  // Инсерт, кюри, ппц!
  
  Future<void> insertDog(Dog dog) async {
    await db!.insert(
      'dogs',
      dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
    );
    setState(() {});
  }

  Future<List<Dog>> dogs() async {
    final List<Map<String, dynamic>> maps = await db!.query('dogs');
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<Dog> getDog(int id) async {
    final List<Map<String, dynamic>> maps = await db!.query('dogs', where: 'id = ?', whereArgs: [id]);
    return List.generate(1, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    }).first;
  }

  Future<void> updateDog(Dog dog) async {
    await db!.update('dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
    setState(() {});
  }

  Future<void> deleteDog(int id) async {
    await db!.delete('dogs',
      where: 'id = ?',
      whereArgs: [id]
    );
    setState(() {});
  }

  Future<void> executeCommand() async {
    final res = await db!.rawQuery('SELECT name FROM dogs');
    setState(() {});
  }

  void _showForm(BuildContext context, int? idx) async {
    if (idx != null) {
      final Dog dog = await getDog(idx);
      _idController.text = dog.id.toString();
      _nameController.text = dog.name;
      _ageController.text = dog.age.toString();
    } else {
      _idController.text = '';
      _nameController.text = '';
      _ageController.text = '';
    }

    if(context.mounted) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (ctx) =>
              Container(
                padding: EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: MediaQuery
                    .of(ctx)
                    .viewInsets
                    .bottom + 10),
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
                    const SizedBox(height: 10.0),
                    TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: 'Age'),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () async {
                        (idx == null) ? insertDog(
                            Dog(id: int.parse(_idController.text),
                                name: _nameController.text.trim(),
                                age: int.parse(_ageController.text)))
                            : updateDog(
                            Dog(id: int.parse(_idController.text.trim()),
                                name: _nameController.text.trim(),
                                age: int.parse(_ageController.text.trim())));
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('SQL Lite Example'), centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                child: FutureBuilder<List<Dog>>(
                  future: dogs(),
                  builder: (_, snapshot) {
                    if(snapshot.connectionState == ConnectionState.done) {
                      return (snapshot.data != null && snapshot.data!.isNotEmpty)
                        ? ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) {
                            final dog = snapshot.data![index];
                            return ListTile(
                              title: Text('${dog.id} - ${dog.name} - ${dog.age}'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () =>  _showForm(context, snapshot.data![index].id),
                                    tooltip: 'Rename',
                                    icon: const Icon(Icons.edit),
                                  ),
                                  const SizedBox(width: 5.0),
                                  IconButton(
                                    onPressed: () => deleteDog(snapshot.data![index].id),
                                    tooltip: 'Delete',
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            );
                          }
                      )
                      : const Center(child: Text('No data in Database'));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        tooltip: 'Insert',
        child: const Icon(Icons.add),
      ),
    );
  }
}
