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
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isFirstVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _isFirstVisible
        ? Padding(
            key: UniqueKey(),
            padding: const EdgeInsets.all(16.0),
            child: const CustomStatelessWidget(text: 'Hello')
          )
        : Container(
            key: UniqueKey(),
            padding: const EdgeInsets.all(16.0),
            child: const CustomStatelessWidget(text: 'World')
          )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState((){
            _isFirstVisible = !_isFirstVisible;
          })
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomStatelessWidget extends StatelessWidget {
  final String text;
  const CustomStatelessWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
          text: text,
          style: DefaultTextStyle.of(context).style,
        )
    );
  }
}

