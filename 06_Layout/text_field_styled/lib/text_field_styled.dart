import 'package:flutter/material.dart';

class TextFieldStyled extends StatefulWidget {
  const TextFieldStyled({Key? key}) : super(key: key);

  @override
  State<TextFieldStyled> createState() => _TextFieldStyledState();
}

class _TextFieldStyledState extends State<TextFieldStyled> {
  @override
  Widget build(BuildContext context) {
    const Color wColor = Colors.purple;     // Задаем общий цвет widget-а
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Text Field Styled'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Column(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    suffixIcon: Icon(Icons.search, color: wColor),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: wColor, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: wColor, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      gapPadding: 30.0
                    ),

                    hintText: 'Введите значение',
                    helperText: 'Поле для поиска заметок',

                    labelText: 'Search',
                    labelStyle: TextStyle(color: wColor),
                    //floatingLabelAlignment: FloatingLabelAlignment.center,
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    // floatingLabelStyle: TextStyle(
                    //   backgroundColor: Colors.cyan,
                    //   color: Colors.red,
                    // )
                ),
              ),
            ),
            //Text('You have pushed the button this many times:'),
          ],
        ),
      ),
    );
  }
}