import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  const ItemMenu({Key? key, required this.title, required this.icon, required this.route, this.active = false}) : super(key: key);

  final bool active;    // Активность (подсветка) пунка меню
  final String title;   // Название аунка меню
  final IconData icon;  // Предществующая иконка
  final String route;   // Маршрут перехода при нажатии на пункт меню

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icon,
          color: active ? Colors.blue : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(color: active ? Colors.blue : Colors.grey),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
    );
  }
}
