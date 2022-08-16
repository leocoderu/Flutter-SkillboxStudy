import 'dart:ui';

import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';

class CupertinoExample extends StatefulWidget {
  const CupertinoExample({Key? key}) : super(key : key);
  @override
  State<CupertinoExample> createState() => _CupertinoExampleState();
}

// Добавляет отступы сверху и снизу по интерфейсу телефона
class _CupertinoExampleState extends State<CupertinoExample>{
  void _showModalPopup(String title) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 240,
        color: CupertinoColors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(color: CupertinoColors.activeGreen),
              ),
              const SizedBox(height: 12),
              const Text(
                  "The scaffold will expand to fill the available space. That usually means that it will occupy its entire window or device screen. When the device's keyboard appears the Scaffold's ancestor MediaQuery widget's MediaQueryData.viewInsets changes and the Scaffold will be rebuilt. By default the scaffold's body is resized to make room for the keyboard."
              ),
            ],
          ),
        ),
      ),
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
    );
  }
  
  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        trailing: Icon(CupertinoIcons.info),        // Позади заголовка
        leading: Text('Leading'),                   // До заголовка
        middle: Text('middle'),                     // Сам заголовок
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text(
                  "It is typically not necessary to nest Scaffolds. For example, in a tabbed UI, where the bottomNavigationBar is a TabBar and the body is a TabBarView, you might be tempted to make each tab bar view a scaffold with a differently titled AppBar. Rather, it would be better to add a listener to the TabController that updates the AppBar"
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                      child: const Text('Button'),
                      onPressed: () {
                        _showModalPopup('Button');
                      }
                  ),
                  const SizedBox(height: 24),
                  CupertinoButton.filled(
                      child: const Text('Filled'),
                      onPressed: () {
                        _showModalPopup('Filled button');
                      }
                  ),
                  const SizedBox(height: 24),
                  const CupertinoTextField(
                    placeholder: 'Заполните поле e-mail'
                  ),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
