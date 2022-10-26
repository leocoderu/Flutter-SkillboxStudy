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
        title: const Text('Animations'),
        centerTitle: true,
      ),
      body: ListView(
        children: spaces.map((space) =>
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => DetailView(data: space)
                    )
                );
              },
              child: Card(
                color: Colors.black26,
                clipBehavior: Clip.antiAlias,       // Обрезаем выступающие края дочерних элементов
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Скругление краев
                margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child:
                 Stack(
                   children: [
                      Column(
                        children: [
                          Hero(
                            tag: space.id,
                            child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(space.image, fit: BoxFit.fitWidth)
                            )
                          ),
                          Hero(
                            tag: '${space.id}-title',
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  space.description,
                                  overflow: TextOverflow.ellipsis, // При переполнении текстом ставит ...
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                     Positioned(
                         top: 35,
                         right: 20,
                         child:Hero(
                             tag: '${space.id}-button',
                             child: Container(
                                 height: 30,
                                 width: 30,
                                 color: Colors.orangeAccent,
                                 child: const Icon(Icons.add, size: 20)
                             )
                         )
                     ),
                   ],
                 ),
              )
            ),
        ).toList()
      ),
    );
  }
}