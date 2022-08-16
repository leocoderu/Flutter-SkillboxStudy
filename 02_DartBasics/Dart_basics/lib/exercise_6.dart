// Возводим число n в произвольную степень p
int _myPow(int n, int p){
  if (p == 0) return 1;                         // Если степень 0 возвращам единицу
  int res = n;                                  // Результирующая переменная
  for(int i = 1; i < p; i++) { res *= n; }      // В цикле возводим в степень число перемножая результат на число
  return res;
}

// Вычисление квадратного корня
double _mySqrt(dynamic n) {                         // dynamic типизация, т.к. может передаваться как double так и int тип
  if(n < 0) throw Exception('Error: Value must not be negative!');  // Если число отрицательное то выбрасываем ошибку
  return _myNRoot(n.toDouble(), 2);                 // Вычисляем корень второй степени числа
}

// Получаем модуль числа
double _myAbs(double x) => (x < 0)? -x : x;         // Если число отрицательное инвертируем его знак

// Вычисляем корень n-ой степени числа
double _myNRoot(double n, int p){
  if(n < 0) throw Exception('Error: Value must not be negative!'); // Если число отрицательное то выбрасываем ошибку

  double eps = 0.0001;              // Точность вычисления
  double root = n / p;              // Начальное приближение корня
  double rn = n;                    // Значение корня последовательным делением

  while(_myAbs(root - rn) >= eps){  // Цикл выполняется пока разница вычимления больше заданной точности
    rn = n;
    for(int i = 1; i < p; i++){
      rn /= root;
    }
    root = 0.5 * (rn + root);
  }
  return root;
}

class Point{
  late int _x, _y, _z;                          // Внутренние координаты точки

  /*void initialize(){                            // Конструктор пустой
    _x = 0;   // Блин, ну как-же создать конструктор Point() с значениями по умолчанию 0,0,0 ???
    _y = 0;   // Почему нет перегрузки конструкторов?!?
    _z = 0;
  }*/

  Point(this._x, this._y, this._z);             // Конструктор с координатами

  factory Point.zero() => Point(0, 0, 0);       // Установка нулевой точки

  double distanceTo(Point another){
    return _mySqrt(
        _myPow(another._x - _x, 2)
      + _myPow(another._y - _y, 2)
      + _myPow(another._z - _z, 2));
  }

}

void main() {
  //pOne.initialize();
  Point pOne = Point(1, 2, 3);
  Point pTwo = Point(-7, -2, 4);
  //Point pOne = Point.zero();
  //Point pTwo = Point(3, 3, 3);

  // ignore: avoid_print
  print('${pOne.distanceTo(pTwo)}');    // Result: 9
}