import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const MyHomePage(title: 'Animation Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                alignment: Alignment.topRight,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {                          // 100/4 + 5/2 = 27.5
                    double dX = _controller.value * ((MediaQuery.of(context).size.width/2) - (27.5 *(_controller.value + 1))) * -1 - 5.0;
                    double dY = _controller.value * ((MediaQuery.of(context).size.height/2) - (65 *(_controller.value + 1))) + 5.0;
                    return Transform.translate(                                             // 65 ??????
                      transformHitTests: true,
                      offset: Offset(dX, dY),
                      child: Transform.scale(
                        transformHitTests: true,
                        scale: (MediaQuery.of(context).size.height > 500) ? 1 + _controller.value * 1.5 : 1 + _controller.value,   // 100 <-> 250
                        child: GestureDetector(
                          onTap: () {_controller.value == 0 ? _controller.forward() : _controller.reverse();},
                          child: Container(
                            color: Colors.indigoAccent,
                            height: 100,
                            width: 100,
                            child: const FlutterLogo(),
                          ),
                        ),
                      )
                    );
                  },
                ),
              ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.green,
            height: 70,
            width: double.infinity,
            child: Column(
              children: [
                const Text('Bottom Bar'),
                Text('Aspect Ratio: ${MediaQuery.of(context).size.aspectRatio.toString()}'),
                Text('width: ${MediaQuery.of(context).size.width.toString()}'),
                Text('height: ${MediaQuery.of(context).size.height.toString()}'),
              ],
            ),

          ),
        ],
      )
    );
  }
}
