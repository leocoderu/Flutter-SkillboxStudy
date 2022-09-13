import 'package:flutter/material.dart';
import 'package:future_builder/fetch_file.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Builder'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchFileFromAssets('assets/data.txt'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                  child: CircularProgressIndicator()
              );
            case ConnectionState.active:
              return const Center(
                  child: CircularProgressIndicator()
              );
            case ConnectionState.done:
              return SingleChildScrollView(
                child: Text(snapshot.data),
              );
            default:
              return const Center(
                child: CircularProgressIndicator()
              );
          }
        },
      )
    );
  }
}
