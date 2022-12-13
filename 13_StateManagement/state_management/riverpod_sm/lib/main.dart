import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_sm/fluro_router.dart';
import 'package:riverpod_sm/app_state.dart';

void main() {
  MyFluroRouter.setupRouter();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        initialRoute: '/',
        onGenerateRoute: MyFluroRouter.router.generator,
    );
  }
}


