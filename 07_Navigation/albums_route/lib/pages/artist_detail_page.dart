import 'package:flutter/material.dart';

class ArtistDetailPage extends StatelessWidget {
  const ArtistDetailPage({Key? key, this.title, this.about}) : super(key: key);
  final String? title;
  final String? about;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$title'),
          centerTitle: true,
        ),
        body: Scrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Text('$about'),
            ),
        ),
    );
  }
}

