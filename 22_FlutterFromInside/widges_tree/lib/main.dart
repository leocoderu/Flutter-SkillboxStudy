import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => Center( child:
    ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 10, // 70
          minHeight: 10, // 70
          maxWidth: 150,
          maxHeight: 150
        ),
      child: Container(
        color: const Color.fromARGB(255, 255, 0, 0),
        width: 50,
        height: 50,
      ),
    ),
  );
}