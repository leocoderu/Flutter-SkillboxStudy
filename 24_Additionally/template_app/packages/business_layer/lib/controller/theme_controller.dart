// Import Flutter
import 'package:flutter/material.dart';

// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:data_layer/data_layer.dart';

class ThemeController {
  Future<void> init() async => await locator.get<ThemeDataCustom>().init();

  ThemeMode get() => locator.get<ThemeDataCustom>().get();

  Future<void> set(ThemeMode value) async => await locator.get<ThemeDataCustom>().set(value);

}