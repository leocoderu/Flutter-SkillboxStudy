import 'package:flutter/material.dart';

class Item {
  Item({required this.icon, required this.title, required this.route, this.active = false});

  final String title;   // Название аунка меню
  final IconData icon;  // Предществующая иконка
  final String route;   // Маршрут перехода при нажатии на пункт меню
  final bool active;    // Активность (подсветка) пунка меню, по умолчанию "Не активна"
}