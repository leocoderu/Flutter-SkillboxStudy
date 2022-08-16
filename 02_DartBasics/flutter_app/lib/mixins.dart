class Man {
  final String name;
  final int age;

  Man(this.name, this.age);
}

class OldMan extends Man with OldnessCalculator {
  OldMan(String name, int age) : super(name, age);
}

mixin OldnessCalculator on Man {
  bool get isKid => age < 15;
}