import 'package:flutter/material.dart';

class PageViewExample extends StatefulWidget{
  const PageViewExample({Key? key}) : super(key: key);
  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  final PageController _controller = PageController(
    viewportFraction: .8,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page View'),
        centerTitle: true,
      ),
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          debugPrint(index.toString());
        },
        children: [
          Container(
            color: Colors.deepOrange,
            child: const Center(
              child: Text('Page number 1'),
            ),
          ),
          Container(
            color: Colors.cyan,
            child: const Center(
              child: Text('Page number 2'),
            ),
          ),
          Container(
            color: Colors.purple,
            child: const Center(
              child: Text('Page number 3'),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text('Page number 4'),
            ),
          ),
        ],
      )
    );
  }
}