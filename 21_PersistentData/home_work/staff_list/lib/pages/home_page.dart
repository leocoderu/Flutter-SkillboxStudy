import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:model/model.dart';
import 'package:staff_list/pages/adduser_page.dart';
import 'package:staff_list/widgets/staff_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class StorageItem {
  StorageItem({required this.key, required this.value});
  String key;
  String value;
}

class _HomePageState extends State<HomePage> {
  FlutterSecureStorage? storage;
  late MyDatabase _usersbase;

  @override
  void initState() {
    super.initState();
    _usersbase = MyDatabase();

    storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    );
  }

  //Add User
  Future<void> _addUser(FullUser? fUser) async {
    if (fUser != null) {
      await _usersbase.insertUser(fUser);
      storage?.write(key: 'cards_number_${fUser.id}', value: fUser.card_num);
    }
  }

  //Clear Database
  void _deleteAll() => _usersbase.deleteAll();
  //Delete User
  void _deleteUser(User user) => _usersbase.deleteUser(user);
  //Update User
  void _updateUser(FullUser fUser) {
    _usersbase.updateUser(fUser);
    storage?.write(key: 'cards_number_${fUser.id}', value: fUser.card_num);
  }

  String dateToString(DateTime? dt) => dt != null
      ?'${dt.day < 10 ? '0' : ''}${dt.day}.${dt.month < 10 ? '0' : ''}${dt.month}.${dt.year}' : '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Users List'), centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: _deleteAll,
        //     icon: Icon(Icons.delete),
        //   ),
        // ],
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
              return Slidable(
                key: UniqueKey(),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute<Widget>(
                            builder: (BuildContext context) {
                              return AddUserPage(
                                user: user.data![idx],
                                maxID: 0,   // TODO: Warning!!!!
                                onGetValue: (value) => _updateUser(value),
                              );
                            },
                          ),
                        ),
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => _deleteUser(user.data![idx]),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                ),
                child: StaffCard(
                  user: user.data![idx],
                  card_number: user.data![idx].card,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final int nID = await _usersbase.lastUser.then((e) => e?.id).onError((error, stackTrace) => null) ?? -1;
          Navigator.of(context).push(
            MaterialPageRoute<Widget>(
              builder: (BuildContext context) {
                return AddUserPage(
                  maxID: nID,
                  onGetValue: (value) => _addUser(value),
                );
              },
            ),
          );
        },
        tooltip: 'Add User',
        child: const Icon(Icons.person_add),
      ),
    );
  }
}