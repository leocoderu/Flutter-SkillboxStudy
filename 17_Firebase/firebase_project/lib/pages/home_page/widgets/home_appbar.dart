import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return BottomAppBar(
      //onTap: ,
      //currentIndex: ,
      color: Colors.blue,
      height: 100,
      shape: CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children:[
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:[
                Icon(Icons.ac_unit),
                Text("Полный список"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:[
                Icon(Icons.ac_unit),
                Text("Уже куплено"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}