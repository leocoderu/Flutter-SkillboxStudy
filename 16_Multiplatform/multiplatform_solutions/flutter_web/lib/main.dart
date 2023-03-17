import 'package:flutter/material.dart';

import 'package:flutter_web/app_platform.dart';
import 'package:flutter_web/elm_style.dart';
import 'package:flutter_web/fetch_html.dart';

import 'mock_web_view.dart'
  if (dart.library.io) 'not_web_view.dart'
  if (dart.library.html) 'web_view.dart';


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
  String _urlPath = '';

  TextEditingController findController = TextEditingController();

  Future<void> _setURL() async {
    setState(() => _urlPath = findController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter for web', style: TextStyle(fontFamily: 'Prompt'),),
        centerTitle: true,
      ),
      body:Column(
          children: <Widget>[
            Expanded(
              //child: webView(_urlPath),
              child: _urlPath != ''
                  ? FutureBuilder(
                      future:  fetchHTML(_urlPath),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.done:
                              final RegExp regExpTitle = RegExp(r'<title>(.*?)</title>');
                              final String existCORS = snapshot.data.headers['access-control-allow-origin'] == null ? 'None' : snapshot.data.headers['access-control-allow-origin'].toString();
                              return SingleChildScrollView(
                                child: Column(
                                  children:[
                                    if (regExpTitle.firstMatch(snapshot.data.body) != null)
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                                        child: Text(regExpTitle.firstMatch(snapshot.data.body)!.group(1).toString(),
                                          style: headerStyle,
                                        ),
                                      ),
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.only(bottom: 10.0),
                                      child: Text('CORS Header: $existCORS',
                                        textAlign: TextAlign.left,
                                        style: corsStyle,
                                      ),
                                    ),
                                    Text(snapshot.data.body.toString()),
                                  ]
                                )
                              );
                            default:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                          }
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                    )
                  : const Center(child: Text('Enter URL please', style: TextStyle(fontFamily: 'Prompt'))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),//color: Colors.green,
              //height: 100,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(2.0),
                            height: 45.0,
                            child: TextFormField(
                              decoration: inputDecor,
                              controller: findController,
                              style: inputStyle,
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child:
                        ElevatedButton(
                          onPressed: _setURL,
                            style: btnStyle,
                          child: const Text('LOAD'),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text('APPLICATION RUNNING ON ${AppPlatform.getPlatform()}',
                        style: footerStyle,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}
