// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_svg/flutter_svg.dart';

/*const String assetName = 'assets/svg/apple.svg';
final Widget svg = SvgPicture.asset(
  assetName,
  semanticsLabel: 'Acme Logo',
);

final Widget networkSvg = SvgPicture.network(
  'https://site-that-takes-a-while.com/image.svg',
  semanticsLabel: 'A shark?!',
  placeholderBuilder: (BuildContext context) => Container(
      padding: const EdgeInsets.all(30.0),
      child: const CircularProgressIndicator(),),
);*/

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

            SvgPicture.asset(
              'assets/svg/fractal.svg',
              height: 50,
              width: 50,
              allowDrawingOutsideViewBox: true,),

            SvgPicture.network(
              'https://www.svgrepo.com/show/2046/dog.svg',
              placeholderBuilder: (context) => const CircularProgressIndicator(),
              height: 128.0,
            ),

            const Text.rich(
              TextSpan(
                style: TextStyle(
                    color: Colors.blueAccent,
                  fontFamily: 'Comfortaa',
                  fontSize: 20,
                ),
                children: [
                  TextSpan(text: 'Charlotte '),
                  TextSpan(
                    text: 'Hope',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),

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
        child: SvgPicture.asset(
            'assets/svg/apple.svg',
            height: 40,
            width: 40,
        ),
        //Icon(Icons.heart_broken),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
