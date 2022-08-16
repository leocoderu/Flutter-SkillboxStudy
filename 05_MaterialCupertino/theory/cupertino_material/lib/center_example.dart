import 'package:flutter/material.dart';

class CenterExample extends StatefulWidget {
  const CenterExample({Key? key}) : super(key : key);
  @override
  State<CenterExample> createState() => _CenterExampleState();
}

// Добавляет отступы сверху и снизу по интерфейсу телефона
class _CenterExampleState extends State<CenterExample>{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child: Text('Area Example'),
      ),
    );
  }
}
