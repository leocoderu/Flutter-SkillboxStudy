import 'package:flutter/cupertino.dart';
import 'package:material_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProviderCupertino(),)
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeProviderCupertino = Provider.of<ThemeProviderCupertino>(context);
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: themeProviderCupertino.current,
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
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProviderCupertino>(context);
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(),
        child: SafeArea(
            child: Column(
              children: [
                const Text('Cupertino'),
                CupertinoButton(
                  onPressed: () {
                    if(themeProvider.brightness == CustomBrightness.light) {
                      themeProvider.toggle(CustomBrightness.dark);
                    } else {
                      themeProvider.toggle(CustomBrightness.light);
                    }
                  },
                  child: const Text('Press me'),
                ),
              ],
            ),
        ),
    );
  }
}
