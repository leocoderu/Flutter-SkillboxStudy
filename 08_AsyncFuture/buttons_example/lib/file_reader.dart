//import 'dart:html';

import 'package:flutter/material.dart';

class FileReader extends StatelessWidget {
  const FileReader({super.key});

  void eventButton(String txt){
    debugPrint(txt);
  }

  void eventLongButton(String txt){
    debugPrint(txt);
  }

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.red),         // Цвет поверхности кнопки
      foregroundColor: MaterialStateProperty.all(Colors.yellow),      // Цвет текста и иконок
      overlayColor: MaterialStateProperty.all(Colors.green),          // Цвет анимации нажатия
      shadowColor: MaterialStateProperty.all(Colors.blue),            // Цвет тени
      elevation: MaterialStateProperty.all(10),                       // Высота кнопки от поверхности
      padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)), // Отступы от края
      minimumSize: MaterialStateProperty.all(const Size(200, 40)),    // Минимальная высота и ширина кнопки
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),                  // Скругление рамки
          side: const BorderSide(color: Colors.indigoAccent),         // Цвет рамки
        ),
      ),
      alignment: Alignment.centerLeft,                                // Позициониррование текста в кнопке
      //visualDensity: const VisualDensity(horizontal: 3, vertical: 3)  // Масштабирование кнопки
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('File Reader'),
        centerTitle: true,

      ),
      drawer: const Center(
        child: Text('Drawer'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  children: <Widget>[
                    const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                              //prefixIcon: Icon(Icons.search),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                                //gapPadding: 30.0
                              ),

                            hintText: 'Например: hope.txt',
                            //helperText: 'Открытие текстового файла',
                            labelText: 'Введите имя файла'
                          ),
                        )
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20.0, vertical: 21.5)),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      child: const Text('Найти'),
                      onPressed: () {},
                    )
                  ],
                ),

            ),
            const Divider(),
            const Text('You have pushed the button this many times:'),
            const Divider(),
            ElevatedButton(
              clipBehavior: Clip.hardEdge,                      // Обрезает выступающий текст за края кнопки
              style: style,
              onLongPress: () {
                eventLongButton('Elevated button long pressed');
              },
              onPressed: () {
                eventButton('Elevated button pressed');
              },
              child: const Text('ElevatedButton'),
            ),
            OutlinedButton(
              style: style,
              onLongPress: () {
                eventLongButton('Outlined button long pressed');
              },
              onPressed: () {
                eventButton('Outlined button pressed');
              },
              child: const Text('OutlinedButton'),
            ),
            TextButton(
              style: style,
              onLongPress: () {
                eventLongButton('Text button long pressed');
              },
              onPressed: () {
                eventButton('Text button pressed');
              },
              child: const Text('TextButton'),
            ),
            IconButton(
              iconSize: 48,                         // Размер иконки
              padding: const EdgeInsets.all(15.0),  // Отступы от краев
              alignment: Alignment.topLeft,         // Равнение иконки внутри кнопки
              splashRadius: 200.0,                  // Тень от нажатия кнопки
              splashColor: Colors.purpleAccent,     // Цвет расплывающейся тени
              highlightColor: Colors.green,         // Цвет фона при нажатии на кнопку
              color: Colors.indigoAccent,           // Цвет иконки
              disabledColor: Colors.cyan,           // Цвет отключенной кнопки

              icon: const Icon(Icons.person),       // Иконка кнопки
              //onPressed: null,                    // Отключение кнопки
              onPressed: () {
                eventButton('Icon button pressed');
              },
            )
          ],
        ),
      ),
    );
  }
}


// const TextField(
// decoration: InputDecoration(
// contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//   prefixIcon: Icon(Icons.search),
//   enabledBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.red, width: 2.0),
//     borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
//   ),
//
//   focusedBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.red, width: 2.0),
//     borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
//     //gapPadding: 30.0
//   ),

//hintText: 'Например: hope.txt',
//helperText: 'Открытие текстового файла',
//labelText: 'Введите имя файла'
// ),
// ),