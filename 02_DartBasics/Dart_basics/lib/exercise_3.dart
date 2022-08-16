// Получение всех цифр из строки
List<num?> getNumsBySym(String s){
  List<num?> res = [];                // Результирующая переменная
  for(int i = 0; i < s.length; i++){  // Перебираем все символы строки
    num? tmp = num.tryParse(s[i]);    // Парсим символ в num
    if(tmp != null) res.add(tmp);     // Если символ распарсился удачно, добавляем цифру в список
  }
  return res;
}
// Получение цифры, если оно составляет слово
List<num?> getNumsByWords(String s){
  List<num?> res = [];                // Результирующая список
  List<String> words = s.split(' ');  // Создаем список слов
  words.forEach((e) {                 // Проход по списку слов
    num? tmp = num.tryParse(e);       // Пробуем распарсить слово
    if(tmp != null) res.add(tmp);     // Если символ распарсился удачно, добавляем цифру в список
  });
  return res;
}

void main() {
  // ignore: avoid_print
  print(getNumsBySym('Hello honey, my phone number is +7 (909) 123-45-76, call me :)'));
  // Результат: 79091234576

  // ignore: avoid_print
  print(getNumsByWords('Hello honey, my phone number is +7 (909) 123-45-76, call me :)'));
  // Результат: 7
}