import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_example/user.dart';

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
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (_, snapshot) {
          if(!snapshot.hasData) {
            return ElevatedButton(
                onPressed: signIn,
                child: const Center(
                  child: Text('Login'),
                )
            );
          } else {
            return const MyHomePage();
          }
        }
      ),
    );
  }

  void signIn(){
    if(kIsWeb){
      signInWithGoogleWeb();
    } else {
      //print('signIn: Look here!!!!!');
      signInWithGoogle();
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    // const List<String> scopes = <String>[
    //   'email',
    //   'https://www.googleapis.com/auth/contacts.readonly',
    // ];

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //print('signInWithGoogle: Look here!!!!!');
    //print(googleUser?.email);

    if(googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }

  Future<UserCredential?> signInWithGoogleWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider.addScope('https://www.googleapis.com/auth/contacts');  // .readonly
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final storage = FirebaseStorage.instance;
  late CollectionReference<Person> _users;

  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void initState(){
    super.initState();

    _users = FirebaseFirestore.instance.collection('users').withConverter<Person>(
        fromFirestore: (snapshot, _) => Person.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
    );
  }

  void _submit(){
    _users.add(
      Person(
        name: _nameController.text,
        amount: int.parse(_amountController.text),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: SizedBox(
              width: 120,
              height: 100,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: FutureBuilder<String>(
                  future: storage.ref('image.png').getDownloadURL(),
                  builder: (_, snapshot) => snapshot.connectionState == ConnectionState.done
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

