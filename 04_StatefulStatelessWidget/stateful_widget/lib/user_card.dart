import 'package:flutter/material.dart';

class UserCard extends StatelessWidget{
  const UserCard({
    Key? key,
    required this.name,
    required this.age,
  }) : super( key: key);

  final String name;
  final int age;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.green[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(name),
            Text('$age'),
          ],
        ),
      ),
    );
  }
}