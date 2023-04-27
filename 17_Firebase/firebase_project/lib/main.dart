import 'package:flutter/material.dart';

import 'package:firebase_project/fluro_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:business_sm/business_sm.dart';

void main() {
  MyFluroRouter.setupRouter();
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

