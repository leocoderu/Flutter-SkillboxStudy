class Todo {
  final String name;
  Todo(this.name);
}

class _SimpleTodo {
  final String name;
  _SimpleTodo(this.name);
}

class Person {
  String? _name;
  int? age;
}

void getPersonName() {
  var user = Person();
  user._name = 'Gerald';
  user.age = 35;
  print(user);

  var simple = _SimpleTodo('simple name');
  print(simple.name);
}