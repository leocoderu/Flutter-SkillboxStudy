import 'package:flutter/material.dart';

import 'package:mime/mime.dart';
import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery Store',
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
  final TextEditingController _fileController = TextEditingController();
  List<FileSystemEntity> fileName = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    fileName = await docDir.list(recursive: true).where((e) => isImage(e.path)).toList();
    setState(() {});
  }

  void _saveImage(String url) async {
    var response = await http.get(Uri.parse(url));
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File(path.join(directory.path, path.basename(url)));
    await file.writeAsBytes(response.bodyBytes);

    setState(() {
      fileName.add(file);
    });
  }

  bool isImage(String path) {
    final mimeType = lookupMimeType(path);
    if (mimeType == null) return false;
    return mimeType.startsWith('image/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Gallery'), centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child:  (fileName.isEmpty)
                ? const Center(child: Text('No image loaded'))
                : ListView.builder(
                    itemCount: fileName.length,
                    itemBuilder: (context, index) {
                      return SizedBox(child: Image.file(File(fileName[index].path)));
                    }
                  )
            ),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                      controller: _fileController,
                      decoration: const InputDecoration(hintText: 'Url Image file'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _saveImage(_fileController.text),
                      child: const Text('Save'),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
