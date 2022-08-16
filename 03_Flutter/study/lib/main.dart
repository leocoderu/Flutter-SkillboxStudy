// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:shimmer/shimmer.dart';

//import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget.

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Image.asset('assets/images/image_1.jpg'),
            //Image.network('https://images4.alphacoders.com/601/thumb-1920-601103.jpg'),

            /*const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Charlotte Hope',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),*/

            /*const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Charlotte Hope',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 20
                ),
              ),
            ),*/

            Container(
              height: 300,
              //padding: EdgeInsets.all(20),
              constraints:const BoxConstraints(
                //maxWidth: 200,
                //maxHeight: 100
              ),
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://images4.alphacoders.com/601/thumb-1920-601103.jpg')
                  )
              ),
            ),

            /*ConstrainedBox(
              constraints: const BoxConstraints(
                  maxWidth: 200,
                  maxHeight: 100
              ),
              child: const Text(
                  'Some text'
              ),
            ),*/

            /*const SizedBox(
              //width: 100,
              //height: 25,
              child: Text(
                'Flutter supports using shared packages contributed by other developers to the Flutter and Dart ecosystems. This allows quickly building an app without having to develop everything from scratch.',
              ),
            ),*/

            //Text(Uuid().v4()),

            Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.yellow,
              child: const Text(
                'Charlotte Hope',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            /*const Text.rich(
              TextSpan(
                style: TextStyle(
                    color: Colors.blueAccent,
                  fontFamily: 'Comfortaa',
                  fontSize: 20
                ),
                children: [
                  TextSpan(text: 'Charlotte '),
                  TextSpan(
                    text: 'Hope',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: 25
                    ),
                  ),
                ],
              ),
            ),*/



            /*const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: 10
              ),
            ),*/
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.heart_broken),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
