import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_bloc/business/some_bloc.dart';
import 'package:test_bloc/ui/home_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(                      // <- Add BlocProvider
        create: (_) => SomeBloc(),
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue,),
          home: const HomePage(),             // <- Start UI
        ),
    );
  }
}



