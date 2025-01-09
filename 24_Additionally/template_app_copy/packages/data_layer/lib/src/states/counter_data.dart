// Import Packages
import 'package:hive_flutter/hive_flutter.dart';

class CounterData {
  static String boxName = 'template_app';
  static String keyName = 'counter';

  const CounterData();

  Future<void> init() async {
    if(!Hive.isBoxOpen(boxName)) {
      await Hive.initFlutter();
      await Hive.openBox<int>(boxName);
    }
  }

  //ValueListenable<Box<int>> listenable() => Hive.box<int>(boxName).listenable();

  int get() {
    final box = Hive.box<int>(boxName);
    return box.get(keyName) ?? 0;
  }

  Future<void> set(int value) async {
    final box = Hive.box<int>(boxName);
    return await box.put(keyName, value);
  }

  // Future<void> inc() async {
  //   int counter = await get();
  //   await set(++counter);
  // }
  //
  // Future<void> dec() async {
  //   int counter = await get();
  //   await set(--counter);
  // }
}
