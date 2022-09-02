import 'package:flutter/material.dart';

class Nav {
  Nav({required this.icon, required this.title});

  final IconData icon;
  final String title;

  // Нах вот это было, не понятно...
  //Nav.fromMap(Map<String, dynamic> json) : this(icon: json['icon'], title: json['title']);
}
