import 'package:flutter/material.dart';

class myProgressIndicator extends StatelessWidget {
  const myProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(),
    );
  }
}
