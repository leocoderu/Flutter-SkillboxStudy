import 'package:flutter/material.dart';

void main() {
  asyncApi();
}

void asyncApi() async {
  debugPrint('Message #1');
  try {
    var data = await getData(3);
    // ignore:avoid_print
    print(data);

  } catch (error) {
    // ignore:avoid_print
    print(error);
  } finally {
    // ignore:avoid_print
    print('Функция вызывается в любом случае');
  }

  debugPrint('Message #2');
}

Future<List<String>> getData([int delay = 1]){
    return Future.delayed(Duration(seconds: delay), () {
      if (delay > 2) {
        return Future.error('Delay > 2');
      }
      return ['Superman', 'Batman', 'Flash', 'Tor'];
    });
}
