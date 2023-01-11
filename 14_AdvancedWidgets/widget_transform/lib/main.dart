import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _transform = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // child: Transform.rotate(
        //     angle: _transform / 2,
        //     transformHitTests: true,
        //     child: GestureDetector(
        //       onHorizontalDragUpdate: (update) {
        //         setState(() {
        //           _transform += update.delta.dx;
        //         });
        //       },
        //       child: const SizedBox(
        //         width: 200.0,
        //         height: 200.0,
        //         child: FlutterLogo(),
        //       ),
        //     ),
        // ),
        // child: Transform.scale(
        //   scale: _transform / 2,
        //   transformHitTests: true,
        //   child: GestureDetector(
        //     onHorizontalDragUpdate: (update) {
        //       setState(() {
        //         _transform += update.delta.dx;
        //       });
        //     },
        //     child: const SizedBox(
        //       width: 200.0,
        //       height: 200.0,
        //       child: FlutterLogo(),
        //     ),
        //   ),
        // ),
        // child: Transform.translate(
        //   offset: Offset(_transform, 0),
        //   transformHitTests: true,
        //   child: GestureDetector(
        //     onHorizontalDragUpdate: (update) {
        //       setState(() {
        //         _transform += update.delta.dx;
        //       });
        //     },
        //     child: const SizedBox(
        //       width: 200.0,
        //       height: 200.0,
        //       child: FlutterLogo(),
        //     ),
        //   ),
        // ),
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(_transform / 20),
          transformHitTests: true,
          alignment: Alignment.center,
          child: GestureDetector(
            onHorizontalDragUpdate: (update) {
              setState(() {
                _transform += update.delta.dx;
              });
            },
            child: const SizedBox(
              width: 200.0,
              height: 200.0,
              child: FlutterLogo(),
            ),
          ),
        ),
      ),
    );
  }
}
