// Получаем модуль числа
double _myAbs(double x) => (x < 0)? -x : x;         // Если число отрицательное инвертируем его знак

extension on num {
  // Вычисление квадратного корня
  num mySqrt() {
    if (this < 0) throw Exception('Error: Value must not be negative!'); // Если число отрицательное то выбрасываем ошибку
    return myNRoot(2); // Вычисляем корень второй степени числа
  }

  // Вычисляем корень n-ой степени числа
  num myNRoot(int p) {
    if (this < 0) throw Exception('Error: Value must not be negative!'); // Если число отрицательное то выбрасываем ошибку

    double eps = 0.0001; // Точность вычисления
    double root = this / p; // Начальное приближение корня
    num rn = this; // Значение корня последовательным делением

    while (_myAbs(root - rn) >= eps) { // Цикл выполняется пока разница вычимления больше заданной точности
      rn = this;
      for (int i = 1; i < p; i++) {
        rn /= root;
      }
      root = 0.5 * (rn + root);
    }
    return root;
  }
}

void main() {
  num newNum = 729;
  // ignore: avoid_print
  print('${newNum.myNRoot(3)}');   // Result: 9

  newNum = 512;
  // ignore: avoid_print
  print('${newNum.myNRoot(2)}');   // Result: 22,627416997969520780827019587355
  newNum = 64;
  // ignore: avoid_print
  print('${newNum.mySqrt()}');        // Result: 8
}