import 'package:flutter/material.dart';

final fakeData = (int count, [bool showPrint = false]) => List<Widget>.generate(
    count,
      (i) {
        if(showPrint) {
          // ignore: avoid_print
          print(i);
        }
        return Card(
          color: Colors.blue[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text('$i'),
          ),
        );
      }
  );
