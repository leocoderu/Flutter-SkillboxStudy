import 'package:flutter/material.dart';
import 'package:albums_route/pages/artist_page.dart';
import 'package:albums_route/pages/home_page.dart';
import 'package:albums_route/menu/item.dart';

List<Item> menu = [
  Item(icon: Icons.home, title: 'Home', route: HomePage.namePage),
  Item(icon: Icons.person_pin, title: 'Artists', route: ArtistPage.namePage),
];