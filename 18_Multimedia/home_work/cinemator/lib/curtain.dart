import 'package:flutter/material.dart';

class Curtain extends StatelessWidget {
  const Curtain({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Text('Can\'t load video by URL!'),
    );
  }
}
