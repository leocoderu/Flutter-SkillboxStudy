import 'package:flutter/material.dart';

class StackExample extends StatefulWidget{
  const StackExample({Key? key}) : super(key: key);
  @override
  State<StackExample> createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  //final List<Widget> _data = List.generate(100, (index) => SimpleCard(index: index.toString()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Image.network('https://i.pinimg.com/200x150/36/ad/0e/36ad0e036efa1dd0697d6a33707fce8e.jpg'),
          Positioned(
              right: 20,
              bottom: 20,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.orangeAccent,
              )
          ),

          const Positioned(
              right: 40,
              bottom: 40,
              child: Text('Stack Text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
          ),

        ],
      ),
    );
  }
}