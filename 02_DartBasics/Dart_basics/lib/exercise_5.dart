// Формирование списка цифр по словарю
Set<int?> getDigits(List<String> words){
  Map<String, int> digits = {   // Создаем словарь соответствия слов и цифр
    'zero': 0,
    'one': 1,
    'two': 2,
    'three' : 3,
    'four' : 4,
    'five' : 5,
    'six': 6,
    'seven' : 7,
    'eight' : 8,
    'nine' : 9
  };

  Set<int?> res={};                           // Результирующая список без повторений
  for(var w in words) {                       // Перебор списка по словам
    if(digits.containsKey(w.toLowerCase())) { // Проверка слова в словаре без учета регистра
      res.add(digits[w.toLowerCase()]);       // Добавляем его значение из словаря к результату
    }                                         // Если значение уже существует оно игнорируется
  }
  return res;
}

void main() {
  List<String> words = ['one', 'two', 'three', 'cat', 'dog', 'zero', 'Zero', 'foUr', 'nInE'];

  Set<int?> digits = getDigits(words);
  for(var e in digits) {
    // ignore: avoid_print
    print('$e');
  }
}