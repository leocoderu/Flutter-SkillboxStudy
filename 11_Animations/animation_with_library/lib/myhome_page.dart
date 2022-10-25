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
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ...spaces.map((item) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: OpenContainer(
                openBuilder: (context, action) => DetailView(data: item),
                closedBuilder: (context, action) => Column(
                  children: [
                    Image.asset(item.image),
                    Text(item.description),
                  ],
                )
            ),
          )).toList()
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

