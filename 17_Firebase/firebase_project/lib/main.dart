import 'package:flutter/material.dart';

import 'package:firebase_project/fluro_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/firebase_options.dart';

import 'package:business_sm/business_sm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyFluroRouter.setupRouter();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(),
      child: MaterialApp(
        title: 'Store App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        onGenerateRoute: MyFluroRouter.router.generator,
      ),
    );
  }
}

