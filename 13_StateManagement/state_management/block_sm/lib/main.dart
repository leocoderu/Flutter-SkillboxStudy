import 'package:flutter/material.dart';

import 'package:block_sm/fluro_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:business_sm/business_sm.dart';

void main() {
  MyFluroRouter.setupRouter();
  // runApp(
  //     BlocProvider<ThemeBloc>(
  //         create: () => ThemeBloc(),
  //         child: const MyApp()
  //     ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeData>(
                  builder: _buildWithTheme,
                ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeData state) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: state,
      initialRoute: '/',
      onGenerateRoute: MyFluroRouter.router.generator,
    );
  }
}
