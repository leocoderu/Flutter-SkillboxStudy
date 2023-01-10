import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextStyleTheme(
          theme: TextTheme(fontSize: 16, textColor: Colors.black),
          child: Builder(
            builder: (innerContext) => Column(
              children: [
                Text('First text',
                  style: TextStyle(
                    fontSize: TextStyleTheme.of(innerContext).fontSize,
                    color: TextStyleTheme.of(innerContext).textColor,
                  ),
                ),
                Text('Second text',
                  style: TextStyle(
                    fontSize: TextStyleTheme.of(innerContext).fontSize,
                    color: TextStyleTheme.of(innerContext).textColor,
                  ),
                ),
                TextStyleTheme(
                  theme: TextTheme(fontSize: 32, textColor: Colors.blueAccent),
                  child: Builder(
                      builder: (innerInnerContext) => Column(
                        children: [
                          Text(
                            'Third text',
                            style: TextStyle(
                              fontSize: TextStyleTheme.of(innerInnerContext).fontSize,
                              color: TextStyleTheme.of(innerInnerContext).textColor,
                            ),
                          ),
                          Text('Fourth text',
                            style: TextStyle(
                              fontSize: TextStyleTheme.of(innerContext).fontSize,
                              color: TextStyleTheme.of(innerContext).textColor,
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class TextStyleTheme extends InheritedWidget {
  final TextTheme theme;

  const TextStyleTheme({
      Key? key,
      required Widget child,
      required this.theme
  }) : super(key: key, child: child);

  // static TextStyleTheme of(BuildContext context) {
  //   final TextStyleTheme? result = context.dependOnInheritedWidgetOfExactType<TextStyleTheme>();
  //   assert(result != null, 'No TextStyleTheme found in context');
  //   return result!;
  // }
  static TextTheme of(BuildContext context) {
    final TextStyleTheme? result = context.dependOnInheritedWidgetOfExactType<TextStyleTheme>();
    assert(result != null, 'No TextStyleTheme found in context');
    return result!.theme;
  }

  @override
  bool updateShouldNotify(TextStyleTheme oldWidget) => theme != oldWidget.theme;
}

class TextTheme {
  final double fontSize;
  final Color textColor;

  TextTheme({
    required this.fontSize,
    required this.textColor
  });
}
