import 'package:flutter/material.dart';

import 'package:model/model.dart';
import 'package:staff_list/pages/adduser_page.dart';
import 'package:staff_list/widgets/staff_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MyDatabase _usersbase;

  @override
  void initState() {
    super.initState();
    _usersbase = MyDatabase();
  }

  Future<void> _addUser(User? user) async {
    if (user != null) await _usersbase.insertUser(user);
  }

  void _deleteAll() {
    _usersbase.deleteAll();
  }

  // Future<void> _addUserS(UsersCompanion? user) async {
  //   if (user != null) await _usersbase.insert(user);
  // }

  //TODO: Get Todo by ID
  //TODO: Update Todo
  //TODO: Delete Todo

  String dateToString(DateTime? dt) => dt != null
      ?'${dt.day < 10 ? '0' : ''}${dt.day}.${dt.month < 10 ? '0' : ''}${dt.month}.${dt.year}' : '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Users List'), centerTitle: true,
        actions: [
          IconButton(
              onPressed: _deleteAll,
              icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: StreamBuilder<List<User>>(
        stream: _usersbase.userStream,
        initialData: [],
        builder: (context, user) {
          return (user.data!.length == 0)
          ? const Center(child: Text('Users list is empty!', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)))
          : ListView.builder(
            itemCount: user.data!.length,
            itemBuilder: (ctx, idx) {
              return StaffCard(user: user.data![idx]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: () => _addUser(_users[0]),
        //onPressed: () => _showForm(context, null),
        onPressed: () async {
          final int nID = await _usersbase.lastUser.then((e) => e?.id) ?? 0;//.onError((error, stackTrace) => print(error)); // 0
          print(nID);
          Navigator.of(context).push(
            MaterialPageRoute<Widget>(
              builder: (BuildContext context) {
                return AddUserPage(
                  maxID: nID,
                  onGetValue: (value) => _addUser(value),
                );
              },
              //TODO: запускаем _addUser(...) с USer-ом возвращенным из формы
            ),
          );
        },
        tooltip: 'Add User',
        child: const Icon(Icons.person_add),
      ),
    );
  }
}