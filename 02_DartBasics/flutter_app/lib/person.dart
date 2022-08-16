class Person {
  late String _name;
  late int _age;

  void initialize(){    // Constructor of class
    _name = '';
    _age = 0;
  }
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);

  //Point.zero() : x = 0, y = 0;
  factory Point.zero(){
    return Point(0, 0);
  }
}

final t = Point(12,34);
final zero = Point.zero();

void getPersonName() {
  var user = Person();
  user.initialize();
  user._name = 'Gerald';
  user._age = 20;
  print(user);
}