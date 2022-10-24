import 'package:flutter/material.dart';
import 'package:hero/models/spaces.dart';

class DetailView extends StatelessWidget {
  final Space data;

  const DetailView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Hero(
                      tag: data.id,
                      child: Image.asset(data.image),
                    ),
                    Positioned(
                      bottom: -24,
                      right: 20,
                      child: Hero(
                        tag: '${data.id}-button',
                        child: Material(
                          child: Material(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                color: Colors.green,
                                child: const Icon(Icons.play_arrow),
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
            ),

            Hero(
              tag: '${data.id}-title',
              child: Material(child: Text(data.description)),
            ),
          ],
        ),
      ),
    );
  }
}
