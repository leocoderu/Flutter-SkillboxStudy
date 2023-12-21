import 'dart:async';

import 'package:flutter/material.dart';
import 'package:native_string/platform/service.dart';
import 'package:native_string/platform/platform_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  final TextEditingController _urlCtrl = TextEditingController();
  StreamSubscription? _subscription;
  final _service = getService();
  int _cnt = 0;

  void _getValue() async {
    final value = await _service.getValue();
    setState(() => _cnt = value);
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headlineSmall;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("The String throw Native platform"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: getWidget() as Widget,
                  hintText: 'You should enter something',
                  helperText: 'This is special field for enter some String to native layer',
                  labelText: 'Enter some text here',
                ),
                keyboardType: TextInputType.url,
                controller: _urlCtrl,
                onSubmitted: (text) {},
              ),
            ),
            const SizedBox(height: 50.0,),
            Text('Text from platform:', style: style),
            StreamBuilder<int>(                    //!!!
              stream: _service.getStream(),
              builder: (context, snapshot) => Text(
                '${snapshot.hasData ? snapshot.data : 'No data'}',
                style: style,
              ),
            ),
            // Text('Value from Platform', style: style),
            // Text('$_cnt', style: style),
          ],
        ),
      ),
      // floatingActionButton: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       FloatingActionButton(
      //         onPressed: _getValue,
      //         heroTag: null,
      //         child: const Icon(Icons.get_app),
      //       ),
      //     ]
      // ),
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
