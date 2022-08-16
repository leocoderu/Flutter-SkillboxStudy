// Метод считает вхождение в текст количества каждого слова и возвращает в виде Map
Map<String, int> counter(List<String> words){
  Map<String, int> res = {};                      // Результирующая список
  for(var w in words){                            // Проход по всем словам списка
    if (!res.containsKey(w)) {                    // Если результирующий список не содержит слова
      res[w] = 1;                                 // Добавляем его
    } else {
      res.update(w, (value) => value = value+1);  // Если уже сожержит, то увеличиваем счетчик на 1
    }
  }
  return res;
}

void main() {
  List<String> words = ['one', 'two', '3', 'January', 'April', 'May', 'bee', 'two', 'April', 'one', 'two', 'bee'];
  // Результат: one: 2, two: 3, 3: 1, January: 1, April: 2, May: 1, bee: 2
  Map<String, int> cnt = counter(words);
  // ignore: avoid_print
  print('$cnt');
}