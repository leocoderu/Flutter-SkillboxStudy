// Переводим цифру из Десятичной в Двоичную строку
String decToBin(int dec){
  if(dec == 0) return '0';                      // Если 0, то возвращаем сразу 0
  String res = '';                              // Результирующая переменная
  while(dec != 0){                              // Пока число еще не ноль выполняем операции
    res = (dec % 2).toString() + res;           // Берем остаток от деления 0 или 1 и добавляем в начало строки
    dec ~/= 2;                                  // Делим на цело обрабатываемое число
  }
  return res;
}

// Возводим число n в произвольную степень p
int _myPow(int n, int p){
  if (p == 0) return 1;                         // Если степень 0 возвращам единицу
  int res = n;                                  // Результирующая переменная
  for(int i = 1; i < p; i++) { res *= n; }      // В цикле возводим в степень число перемножая результат на число
  return res;
}

// Перевод из Бинарной строки в Деситичную
int binToDec(String bin){
  int res = 0;                                  // Результирующая переменная
  int j = 0;                                    // Счетчик степеней
  for(int i = bin.length; i > 0; i--){          // Циклический проход по всем символам
    if((bin[i-1] == '1') || (bin[i-1] == '0')){ // Если встречаем 0 или 1 в строке, обрабатываем
      res += _myPow(2, j) * int.parse(bin[i-1]); // Возводим в степень и умножаем на 0 или 1
      j++;                                      // Увеличиваем счетчик степени
    }
  }
  return res;
}

void main() {
  // ignore: avoid_print
  print('decToBin:');
  for (int i = 0; i < 256; i++) {
    // ignore: avoid_print
    print('$i = ${decToBin(i)}');
  }

  String number = '01010000';   // 80
  // ignore: avoid_print
  print('binToDec: $number = ${binToDec(number)}');

  // test _myPow
  // ignore: avoid_print
  print('_myPow:');
  for (int i = 0; i < 6; i++) {
    // ignore: avoid_print
    print(_myPow(3, i));    // 1, 3, 9, 27, 81, 243
  }
}