import 'package:firebase_example/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
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
  final storage = FirebaseStorage.instance;
  late CollectionReference<User> _users;

  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void initState(){
    super.initState();

    _users = FirebaseFirestore.instance.collection('users').withConverter<User>(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
    );
  }

  void _submit(){
    _users.add(
      User(
        name: _nameController.text,
        amount: int.parse(_amountController.text),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    print(_users.count());
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: SizedBox(
              width: 100,
              height: 100,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                //child: Image.asset('assets/image.png', fit: BoxFit.scaleDown),
                child: FutureBuilder<String>(
                  future: storage.ref('image.png').getDownloadURL(),
                  builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done
                    ? Image.network(snapshot.data!, fit: BoxFit.scaleDown)
                    : const SizedBox(),
                )
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                  child: StreamBuilder(
                    stream: _users.snapshots(),
                    builder: (_, snapshot) {
                      return ListView(
                              children: snapshot.hasData
                                  ? snapshot.data!.docs
                                    .map((e) => ListTile(
                                      leading: Text(e.get('name')),
                                      trailing: Text('${e.get('amount')}\$'),
                                    )).toList()
                                  : [],
                      );
                    }
                  )
              ),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(hintText: 'Name'),
                      )
                    ),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: _amountController,
                        decoration: const InputDecoration(hintText: 'Amount'),
                      )
                    ),
                    ElevatedButton(
                      onPressed: _submit,
                      child: const Text('Submit'),
                    )
                  ],
                ),
              ),
            ],
          )
        ),
    );
  }
}

