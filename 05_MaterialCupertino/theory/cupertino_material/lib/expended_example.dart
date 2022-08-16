import 'package:flutter/material.dart';

class ExpendedExample extends StatefulWidget {
  const ExpendedExample({Key? key}) : super(key : key);
  @override
  State<ExpendedExample> createState() => _ExpendedExampleState();
}

// Добавляет отступы сверху и снизу по интерфейсу телефона
class _ExpendedExampleState extends State<ExpendedExample>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
