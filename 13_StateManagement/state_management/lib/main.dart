import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:state_management/fluro_router.dart';
import 'package:provider/provider.dart';

void main() {
  MyFluroRouter.setupRouter();
  runApp(const MyApp());
}

class AppState with ChangeNotifier {
  ThemeData currentTheme = (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) ? ThemeData.dark() : ThemeData.light();

  int counter = 0;

  void setTheme(ThemeData theme) {
    currentTheme = theme;
    notifyListeners();
  }

  void increment(){
    counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: Consumer<AppState>(
        builder: (context, state, child) =>
            MaterialApp(
              title: 'Flutter Demo',
              theme: state.currentTheme,
              initialRoute: '/',
              onGenerateRoute: MyFluroRouter.router.generator,
            ),
      ),
    );
  }
}


