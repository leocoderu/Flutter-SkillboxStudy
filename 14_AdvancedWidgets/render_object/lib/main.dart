import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Render Object'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Tint(
              color: Colors.red,
              child: Text('You have pushed the button this many times:'),
            )
          ],
        ),
      ),
    );
  }
}

class Tint extends SingleChildRenderObjectWidget {
  final Color color;

  const Tint({super.key, super.child, required this.color});

  @override
  RenderTint createRenderObject(BuildContext context) {
    return RenderTint(
      color: color,
    );
  }
}

class RenderTint extends RenderProxyBox {
  final Color _color;

  RenderTint({
    Color color = Colors.transparent,
    RenderBox? child
  }) : _color = color,
  super(child);

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.drawColor(_color, BlendMode.srcOver);
    if(child != null) {
      context.paintChild(child!, offset);
      context.paintChild(child!, Offset(offset.dx + 4, offset.dy + 4));
    }
  }
}
