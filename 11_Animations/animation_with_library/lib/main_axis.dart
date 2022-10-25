import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'models/spaces.dart';

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
          title: const Text('Animation with Libraries'),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            ...spaces.map((item) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 1200),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return SharedAxisTransition(
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            //transitionType: SharedAxisTransitionType.scaled,
                            transitionType: SharedAxisTransitionType.horizontal,
                            child: child,
                        );
                      },
                      pageBuilder: (context, animation, secondaryAnimation) =>
                        DetailView(data: item)
                    )
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Image.asset(item.image),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(item.description),
                      )
                    ],
                  ),
                ),
              ),
            )

            ).toList()
          ],
        )
    );
  }
}
class DetailView extends StatelessWidget {
  final Space data;
  const DetailView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset(data.image),
          Text(data.description),
          const Text('Same text'),
        ],
      ),
    );
  }
}

