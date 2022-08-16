// Меняем местами занчения переменных
void swap(int x, int y) {
  int tmp = x;
  x = y = tmp;
}
// Полученине Наибольшего общего делителя (НОД)
int gcd(int a, int b) {
  if (a < b) swap(a, b);                // Если значение a меньше занчения b, меняем ззначения переменных
  return (b != 0) ? gcd(b, a % b) : a;  // Если остаток от деления большего на меньшшее == 0, выводим меньшее значение
}
// Получение Наименьшего общего кратного (НОК)
int lcm(int a, int b) {
  return a ~/ gcd(a, b) * b;
}
// Получаем список простых множителей числа
List<int> getPrimeFactorization(int n) {
  List<int> res = [];       // Список результата, по-умолчанию содержит 1
  if(n > 0 && n < 4) {      // Если это простое число 1 / 2 / 3
    res.add(n);             // Добавляем в список
    return res;             // и выходим
  }

  int div = 2;              // Делитель начинается с 2-х
  while(n > 1) {
    while(n % div == 0) {   // Если нет остатка от деления
      res.add(div);         // Добавляем элемент к списку
      n ~/= div;            // Целочиссленное деление n на div с последующим присвоением результата в n
    }
    div = (div == 2) ? div + 1 : div + 2; // Увеличиваем делитель, с учетоом что только 2 - четное число изи простых
  }
  return res;
}

void main() {
  // ignore: avoid_print
  print(gcd(24, 36));   //  12
  // ignore: avoid_print
  print(gcd(15, 20));   //  5
  // ignore: avoid_print
  print(lcm(5, 17));    // 85
  // ignore: avoid_print
  print(lcm(5, 30));    // 30

  getPrimeFactorization(2310).forEach((element) {
    // ignore: avoid_print
    print(element);     // 2, 3, 5, 7, 11
  });

}