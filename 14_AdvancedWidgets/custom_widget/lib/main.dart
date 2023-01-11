import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Custom Widget'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: MyFlutterLogoPainter(),
              ), //FlutterLogo(),
            ),
          ],
        )
      ),
    );
  }
}

class MyFlutterLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = Colors.blueAccent.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final painter2 = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    var path1 = Path()
      ..moveTo(116, 10)
      ..lineTo(172, 10)
      ..lineTo(55, 126)
      ..lineTo(28, 100)
      ..close();

    canvas.drawPath(path1, painter);

    var path3 = Path()
      ..moveTo(118, 190)
      ..lineTo(172, 190)
      ..lineTo(96, 114)
      ..lineTo(70, 140)
      ..close();

    canvas.drawPath(path3, painter2);

    var path2 = Path()
      ..moveTo(172, 92)
      ..lineTo(96, 168)
      ..lineTo(70, 140)
      ..lineTo(118, 92)
      ..close();

    canvas.drawPath(path2, painter);


  }

  @override
  bool shouldRepaint(MyFlutterLogoPainter oldDelegate) {
    return false;
  }

  @override
  bool shouldRebuildSemantics(MyFlutterLogoPainter oldDelegate) {
    return false;
  }
}