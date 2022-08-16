class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);  // <===== Константный конструктор
}

@Todo('seth', 'make this do somthing')
void doSomething(){
  print('do something');
}

// Это типа аннотации в C#