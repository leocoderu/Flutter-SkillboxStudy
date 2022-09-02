import 'package:flutter/material.dart';
import 'package:simple_navigation/pages/about_page.dart';
import 'package:simple_navigation/pages/blog_page.dart';

class SimpleNavigation extends StatefulWidget {
  const SimpleNavigation({Key? key}) : super(key: key);

  @override
  State<SimpleNavigation> createState() => _SimpleNavigationState();
}

class _SimpleNavigationState extends State<SimpleNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Navigation'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           const Text('Navigation'),
           //ElevatedButton(
           //    onPressed: () {},
           //    child: const Text('Home'),
           //),
           ElevatedButton(
             onPressed: () {
               Navigator.of(context).push(
                 MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const AboutPage();
                    }
                 )
               );
             },
             child: const Text('About'),
           ),
           ElevatedButton(
             onPressed: () {
               Navigator.of(context).push(
                   MaterialPageRoute(
                       builder: (BuildContext context) {
                         return const BlogPage();
                       }
                   )
               );
             },
             child: const Text('Blog'),
           ),
         ],
        )
      ),

    );
  }
}

