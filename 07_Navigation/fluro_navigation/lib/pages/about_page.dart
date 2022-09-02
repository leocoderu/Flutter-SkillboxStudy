import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  static const routeName = '/about';
  const AboutPage({Key? key, this.id}) : super(key: key);
  final String? id;

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About Page'),
          centerTitle: true,
          // automaticallyImplyLeading: false,         // Отлючает кновку "Возврат"
        ),
        body: Center(
          child: (widget.id != null) ? Text('AboutPage with id:${widget.id}') : const Text('AboutPage'),
        )
    );
  }
}
