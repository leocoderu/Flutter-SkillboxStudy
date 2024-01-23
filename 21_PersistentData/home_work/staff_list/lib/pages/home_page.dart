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
  List<User> _users = [
    User(
      id: 1,
      name: 'Charlotte',
      soname: 'Hope',
      s_name: 'SecondName',
      dateBirth: DateTime(1991, 10, 15),
      phone: '79094541234',
      card: '2202200212335462',
      photo: 'https://i.pinimg.com/736x/f8/20/60/f820602379345b261428d64a1414c107--british-actresses-beautiful-people.jpg',
    ),
    User(
      id: 2,
      name: 'Olivia',
      soname: 'Wilde',
      s_name: 'SecondName',
      dateBirth: DateTime(1984, 3, 10),
      phone: '79194548899',
      card: '2202223214445562',
      photo: 'https://i.pinimg.com/736x/a9/be/c8/a9bec814740627f201d09826f633c61d.jpg',
    ),
    User(
      id: 3,
      name: 'Maggie',
      soname: 'Grace',
      //s_name: '',
      dateBirth: DateTime(1983, 9, 21),
      phone: '+19194448800',
      card: '2002 2244 1477 5342',
      photo: 'https://sun9-27.userapi.com/impg/MBi8RVnAzFqp2OYqXkfiK95lEBnuBx7gAKfwTg/oM9tjLxnfBo.jpg?size=484x604&quality=96&sign=f67b2b36bc0e62e29a7e1caac84eb13e&c_uniq_tag=k5Xktu1fAmFdnXRwt9a3sgWgXAuh1uZcfu7UR8I098A&type=album',
    ),
    User(
      id: 4,
      name: 'Sarah-Michelle',
      soname: 'Gellar',
      //s_name: '',
      dateBirth: DateTime(1977, 4, 14),
      phone: '+19194558899',
      card: '2002 2244 1477 5342',
      photo: 'https://avatars.dzeninfra.ru/get-zen_doc/5023541/pub_63a5b98fa88640098f65b73c_63a9976b6687fd369d61bb56/scale_1200',
    ),
    User(
      id: 5,
      name: 'Ольга',
      soname: 'Куриленко',
      s_name: 'Константиновна',
      dateBirth: DateTime(1979, 11, 14),
      phone: '+79894768195',
      card: '2022 2278 1467 5843',
      photo: 'http://ik-music.net/file/ольга%20куриленко5.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _usersbase = MyDatabase();
  }

  Future<void> _addUser(User user) async {
    await _usersbase.insertUser(user);
  }

  //TODO: Get Todo by ID
  //TODO: Update Todo
  //TODO: Delete Todo

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sonameController = TextEditingController();
  final TextEditingController _s_nameController = TextEditingController();
  //final TimePickerDialog
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _photoController = TextEditingController();


  String dateToString(DateTime? dt) => dt != null
      ?'${dt.day < 10 ? '0' : ''}${dt.day}.${dt.month < 10 ? '0' : ''}${dt.month}.${dt.year}' : '';

  void _showForm(BuildContext context, int? idx) async {
    String _textOnDateButton = 'Select Day of Birth';

    if (idx != null) {
      _usersbase.getUserById(idx).then((e) {
        _nameController.text = e.name;
        _sonameController.text = e.soname ?? '';
        _s_nameController.text = e.s_name ?? '';
        _phoneController.text = e.phone ?? '';
        _cardController.text = e.card ?? '';
        _photoController.text = e.photo ?? '';
        _textOnDateButton = dateToString(e.dateBirth);
      });
    } else {
      _nameController.text = '';
      _sonameController.text = '';
      _s_nameController.text = '';
      _phoneController.text = '';
      _cardController.text = '';
      _photoController.text = '';
      _textOnDateButton = 'Select Day of Birth';
    }

    TextStyle t1 = (MediaQuery.of(context).size.height < 600) ? TextStyle(fontSize: 9.0) : TextStyle(fontSize: 15.0);

    if(context.mounted) {
      showModalBottomSheet<User>(
          context: context,
          isScrollControlled: true,
          builder: (ctx) => Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: MediaQuery.of(ctx).viewInsets.bottom + 10),
            child: Scrollbar(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    style: t1,
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: 'First Name'),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    style: t1,
                    controller: _sonameController,
                    decoration: const InputDecoration(hintText: 'Soname'),
                  ),
                  TextField(
                    style: t1,
                    controller: _s_nameController,
                    decoration: const InputDecoration(hintText: 'Second Name'),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if(newDate == null) return;
                        setState(() {
                          _textOnDateButton = dateToString(newDate);
                        });
                      },
                      child: Text(_textOnDateButton, style: t1,),
                    ),
                  ),
                  TextField(
                    style: t1,
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Phone Number'),
                  ),
                  TextField(
                    style: t1,
                    controller: _cardController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Debit Card Number'),
                  ),
                  TextField(
                    style: t1,
                    controller: _photoController,
                    decoration: const InputDecoration(hintText: 'Photo URL'),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          // final Person onePerson = Person(
                          //     id: int.tryParse(_idController.text) ?? 0,
                          //     name: _nameController.text.trim()
                          // );
                          // (idx == null) ? _insertPerson(onePerson) : _updatePerson(onePerson);
                          // _nameController.text = '';
                          // _sonameController.text = '';
                          // _s_nameController.text = '';
                          // _phoneController.text = '';
                          // _cardController.text = '';
                          // _photoController.text = '';

                          Navigator.of(context).pop();
                        },
                        child: Text(idx == null ? 'Add User' : 'Update User', style: t1,),
                      ),
                      const SizedBox(width: 10.0),
                      ElevatedButton(
                        onPressed: () {Navigator.of(context).pop();},
                        child: Text('Cancel', style: t1,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Users List'), centerTitle: true,
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
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<Widget>(
              builder: (BuildContext context) => AddUserPage(),
            ),
          );
        },
        tooltip: 'Add User',
        child: const Icon(Icons.person_add),
      ),
    );
  }
}