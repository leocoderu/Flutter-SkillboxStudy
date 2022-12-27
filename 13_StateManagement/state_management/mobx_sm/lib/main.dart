import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:mobx_sm/fluro_router.dart';
import 'package:business_sm/business_sm.dart';

void main() {
  MyFluroRouter.setupRouter();
  runApp(Provider(
    create: (context) => AppState(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Observer(
        builder: (context) => MaterialApp(
          title: 'Flutter Demo',
          theme: state.theme,
          initialRoute: '/',
          onGenerateRoute: MyFluroRouter.router.generator,
        ),
    );
  }
}

