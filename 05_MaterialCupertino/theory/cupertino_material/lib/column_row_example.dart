import 'package:flutter/material.dart';

class ColumnRowExample extends StatefulWidget {
  const ColumnRowExample({Key? key}) : super(key : key);
  @override
  State<ColumnRowExample> createState() => _ColumnRowExampleState();
}

// Добавляет отступы сверху и снизу по интерфейсу телефона
class _ColumnRowExampleState extends State<ColumnRowExample>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 50, height: 50, color: Colors.green,),
            Container(width: 50, height: 50, color: Colors.blue,),
            Container(width: 50, height: 50, color: Colors.pink,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 50, height: 50, color: Colors.green,),
                Container(width: 50, height: 50, color: Colors.blue,),
                Container(width: 50, height: 50, color: Colors.pink,),
              ],)
          ],
        ),
      ),
    );
  }
}
