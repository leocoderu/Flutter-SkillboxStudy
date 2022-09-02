import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  static const routeName = '/blog';
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: const Text('BlogPage'),
          automaticallyImplyLeading: false, // Отлючает кновку "Возврат"
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('BlogPage', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('<< Back'),
              )
            ],
          ),
        )
    );
  }
}
