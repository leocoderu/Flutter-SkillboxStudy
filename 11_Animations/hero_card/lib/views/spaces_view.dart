import 'package:flutter/material.dart';

import 'package:hero_card/models/spaces.dart';
import 'package:hero_card/views/detail_view.dart';

class SpacesPage extends StatefulWidget {
  const SpacesPage({super.key});

  @override
  State<SpacesPage> createState() => _SpacesPageState();
}

class _SpacesPageState extends State<SpacesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spaces'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: spaces.map((space) =>
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => DetailView(data: space)
                    )
                );
              },
              child: Column(
                children: [
                  Hero(
                    tag: space.id,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(space.image),
                    ),
                  ),
                  Hero(
                    tag: '${space.id}-title',
                    child: Material(child: Text(space.description)),
                  ),
                  Hero(
                    tag: '${space.id}-button',
                    child: Material(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.yellow,
                          child: const Icon(Icons.play_arrow),
                        )
                    ),
                  ),
                ],
              )
            )
        ).toList()
      ),
    );
  }
}