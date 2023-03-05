import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CommonThemeProvider(),)
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var commonThemeProvider = Provider.of<CommonThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: commonThemeProvider.currentMaterial,
      home: Builder(
          builder: (context) => CupertinoApp(
            theme: commonThemeProvider.currentCupertino,
            localizationsDelegates: const [
              DefaultCupertinoLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
            ],
            home: const MyHomePage(),
          ),
      )
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var commonThemeProvider = Provider.of<CommonThemeProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: SafeArea(
        child: Column(
          children: [
            const Text('Cupertino Scaffold'),
            ElevatedButton(
              onPressed: () {
                commonThemeProvider.toggle(CustomBrightness.dark);
              },
              child: const Text('Change Theme'),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('widget.title'),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         const Text('You have pushed the button this many times:'),
    //         ElevatedButton(
    //             onPressed: () {
    //               commonThemeProvider.toggle(CustomBrightness.dark);
    //             },
    //             child: const Text('Change Theme'),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
