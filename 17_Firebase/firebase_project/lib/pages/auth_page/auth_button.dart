import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Widget child;
  final void Function()? quickAction;
  final void Function()? longAction;

  AuthButton({super.key, this.longAction, this.quickAction, required this.child});

  @override
  Widget build(BuildContext context) {
    final authButStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),  // Цвет поверхности кнопки
      foregroundColor: MaterialStateProperty.all(Colors.black38),       // Цвет текста и иконок
      overlayColor: MaterialStateProperty.all(Colors.indigo),           // Цвет анимации нажатия
      shadowColor: MaterialStateProperty.all(Colors.black),             // Цвет тени
      elevation: MaterialStateProperty.all(10),                         // Высота кнопки от поверхности
      padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),   // Отступы от края
      fixedSize: MaterialStateProperty.all(const Size(70, 70)),         // Минимальная высота и ширина кнопки
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),                    // Скругление рамки
          side: const BorderSide(color: Colors.indigoAccent),           // Цвет рамки
        ),
      ),
      alignment: Alignment.centerLeft,                                  // Позициониррование текста в кнопке
      //visualDensity: const VisualDensity(horizontal: 3, vertical: 3)  // Масштабирование кнопки
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: OutlinedButton(
        style: authButStyle,
        //ignore: avoid_print
        onLongPress: this.longAction ?? () {print('LongPress');},
        //ignore: avoid_print
        onPressed: this.quickAction ?? () {print('Press');},
        child: this.child,
      ),
    );
  }
}
