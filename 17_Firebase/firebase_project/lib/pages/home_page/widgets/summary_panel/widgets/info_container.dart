// Import Flutter
import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final int? count;

  const InfoContainer({super.key, required this.title, this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(title, style: TextStyle(fontSize: 20, fontFamily: "Ubuntu",),),
          ),
          Text((count == null) ? '0' : '$count',
            style: TextStyle(fontSize: 24, fontFamily: "Ubuntu", fontWeight: FontWeight.bold,),
          ),
        ],
    );
  }
}


