# wiki_app
This is a special Flutter project, links to which are added by users themselves.

## Цели задания
- Научиться пользоваться пакетами для хранения данных на устройстве.
- Научиться хранить данные как в виде пары «ключ-значение», так и в виде файла или SQL-базы данных.
- Научиться хранить сложные типы данных.
- Закрепить навык реализации пользовательского интерфейса.

## Создайте Flutter-приложение, которое хранит записи в категориях.
### Принцип работы: 
- на главном экране отображен список категорий и FloatingActionButton с плюсом для добавления категории;
- кликая на категорию, открывается список записей данной категории;
- каждая запись содержит название и описание;
- кликая на название, открывается страница деталей записи;
- навигация позволяет пользователю перейти назад к списку записей и категорий.
- Хранение записей и категорий можно реализовать с помощью Hive Boxes. Дизайн приложения можно реализовать на свой вкус.

<img src = "/21_PersistentData/home_work/wiki_app/snapshots/1644485893581.jpeg" width ="200" /> <img src = "/21_PersistentData/home_work/wiki_app/snapshots/1644485893656.jpeg" width ="200" /> <img src = "/21_PersistentData/home_work/wiki_app/snapshots/1644485893617.jpeg" width ="200" />

## Snapshots from Wiki App
<img src = "/21_PersistentData/home_work/wiki_app/snapshots/Screenshot_20240127_191818.png" width ="200" /> <img src = "/21_PersistentData/home_work/wiki_app/snapshots/Screenshot_20240127_191843.png" width ="200" /> <img src = "/21_PersistentData/home_work/wiki_app/snapshots/Screenshot_20240127_191912.png" width ="200" />
<img src = "/21_PersistentData/home_work/wiki_app/snapshots/Screenshot_20240127_192024.png" width ="200" /> <img src = "/21_PersistentData/home_work/wiki_app/snapshots/Screenshot_20240127_192035.png" width ="200" /> <img src = "/21_PersistentData/home_work/wiki_app/snapshots/Screenshot_20240127_192057.png" width ="200" />
<img src = "/21_PersistentData/home_work/wiki_app/snapshots/Screenshot_20240127_192107.png" width ="200" /> <img src = "/21_PersistentData/home_work/wiki_app/snapshots/Screenshot_20240127_192221.png" width ="200" />

## Usability commands
- Запуск кодогенерации: flutter pub run build_runner build

## dependencies UI:
- flutter_slidable: ^3.0.1
- hive: ^2.2.3
- hive_flutter: ^1.1.0
- flutter_inappwebview: ^5.8.0

## dependencies Model:
- hive: ^2.2.3
- hive_flutter: ^1.1.0

## dev_dependencies Model:
- hive_generator: ^2.0.1
- build_runner: ^2.4.7