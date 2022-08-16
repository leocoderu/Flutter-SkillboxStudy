//import 'package:flutter_app/todo.dart' as todo;
//import 'package:flutter_app/person.dart' as person;
import 'package:flutter/material.dart';
import 'package:flutter_app/todo.dart' show Person;
import 'package:flutter_app/person.dart' hide Person;

enum Colors2 {
  red,
  green,
  blue,
  black
}

void methodThrowException() {
  throw Exception('I am exeption');
}

void main(){
// Exceptions
  try {
    methodThrowException();
    try {
      methodThrowException();
    } catch (e) {
      rethrow;
    }
  } on Exception catch (e) {
    print('Exception throw');
  } catch (e) {
    print('String throw');
  } finally {
    print('Method completed');
  }
// -----------------------------------------------------------


  //final user1 = todo.Person();
  //final user2 = person.Person();
  int number = 2;
  num number2 = 2.0;        // int or double
  double number3 = 3;

  double newDouble = number.toDouble();
  int newInt = newDouble.round();       // Around Number
  int newInt2 = newDouble.toInt();      // Truncate

  final one = int.parse('one');         // Exception
  final two = double.parse('2.2');      // Result 2.2
  final three = int.tryParse('one');    // null
  final four = double.tryParse('four'); // null
  final five = int.tryParse('5');       // 5

  int parseInteger(Object n) {
    if (n is int) {
      return n;
    }
    throw ArgumentError('n is not an Integer');
  }

  int parseInteger2(Object n) {
    return n as int;                    // May be Exception
  }

  void someWork(Iterable<int> numbers){
    for(var element in numbers){
      print(element);
    }
    //print(numbers[1]);  // Error
  }
// -----------------------------------------------------------
  final map = <String, int> {};
  map['one'] = 1;
  map['two'] = 2;
  //map['three'] = '3'; Error

  print(map['four']); // Res is null
// -----------------------------------------------------------

  void numbersManipulation(List<int>? moreNumbers){
    final additionalNumbers = [7, 8, 9, 0];
    final numbers = [1, 2, 3, 4, 5, 6, ...additionalNumbers, ...?moreNumbers];
  }
// -----------------------------------------------------------

// Cascade notation
  var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;
// -----------------------------------------------------------

// enum on the top
  final color = Colors2.black;
  final allValues = Colors2.values.forEach((element) {
    print(element);
  });
// -----------------------------------------------------------


  String str = 'Leonardo';
  var name = 'Da Vinci';

  dynamic count = 12;
  count = 'sdsd';
  count = false;


  final list = [1, 2, 3];
  final map2 = {1: 'one', 2: 'two', 3: 'three'}; // Dictionary
  final mapValue = map2[2];                      // Result: two, if key doesn't exist, then result will be null

  Set<int> set1 = {1, 2, 3, 4, 5};
  set1.add(2);                      // Won't change, because 2 value already exist

  Runes runes = Runes('\u041F\u0440\u0438');
  print(String.fromCharCodes(runes));

  Symbol libName = #foo_lib;            // WTF???

  final user = Person();
  user.age = 37;

  print(user);
}
