import 'package:flutter/material.dart';
import 'dart:io';

import 'package:load_file/fetch_file.dart';
import 'package:load_file/find_field.dart';

class FileReader extends StatefulWidget {
  const FileReader({super.key});

  @override
  State<FileReader> createState() => _FileReaderState();
}

class _FileReaderState extends State<FileReader> {
  String fileName = '';

  callback(path) {
    setState(() {
      fileName = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Reader'),
        centerTitle: true,
      ),

      drawer:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: ElevatedButton(
                onPressed: ()=> {exit(0)},
                child: const Text('Выход из программы'),
              ),
            )
          ],
        ),

      body: Center(
        child: Column(
          children: <Widget>[
            FindField(
              padding: const EdgeInsets.all(10.0),
              callback: callback
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                child: FutureBuilder(
                    future: fetchFileFromAssets('assets/files/$fileName'),

                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if(snapshot.hasData) {
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
                      } else if(snapshot.hasError  && snapshot.error == 'Empty path') {
                        return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('Для загрузки данных'),
                                  Text('   выберете файл'),
                                ],
                               );
                      } else {
                        return const Center(
                          child: Text('Файл не найден'),
                        );
                      }
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}