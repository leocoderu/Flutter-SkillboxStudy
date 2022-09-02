import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

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
         // automaticallyImplyLeading: false,     // Отключает стрелу "Обратно"
        ),
        body: const Center(
          child: Text('AboutPage'),
        )
    );
  }
}
