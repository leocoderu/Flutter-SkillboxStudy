# staff_list

Stafflist project, with data of users.

## Цели задания
- Научиться пользоваться пакетами для хранения данных на устройстве.
- Научиться хранить данные как в виде пары «ключ-значение», так и в виде файла или SQL-базы данных.
- Научиться хранить сложные типы данных.
- Закрепить навык реализации пользовательского интерфейса.

## Реализуйте Flutter-приложение, которое хранит данные о пользователях, используя пакет drift или floor (на выбор).
- На главной странице должен быть список пользователей (имя, фамилия, возраст, изображение, телефон и данные банковской карты).
- Реализуйте возможность добавления пользователя в БД, удаления из неё и редактирования.
- Сохраняйте данные банковской карты, используя безопасное хранилище данных.
- Дизайн приложения можно реализовать на свой вкус.

## Snapshots from Staff List
<img src = "/21_PersistentData/home_work/staff_list/snapshots/Screenshot_20240127_190613.png" width ="200" /> <img src = "/21_PersistentData/home_work/staff_list/snapshots/Screenshot_20240127_190641.png" width ="200" /> <img src = "/21_PersistentData/home_work/staff_list/snapshots/Screenshot_20240127_190707.png" width ="200" />
<img src = "/21_PersistentData/home_work/staff_list/snapshots/Screenshot_20240127_190717.png" width ="200" /> <img src = "/21_PersistentData/home_work/staff_list/snapshots/Screenshot_20240127_190732.png" width ="200" /> <img src = "/21_PersistentData/home_work/staff_list/snapshots/Screenshot_20240127_190959.png" width ="200" />


## Usability commands
- Запуск кодогенерации: flutter pub run build_runner build
 

## dependencies UI:
- flutter:
    sdk: flutter
- flutter_slidable: ^3.0.1
- mask_text_input_formatter: ^2.8.0
- flutter_secure_storage: ^9.0.0
- cupertino_icons: ^1.0.2

## dependencies Model:
- flutter:
    sdk: flutter
- drift: ^2.15.0
- sqlite3_flutter_libs: ^0.5.18
- path_provider: ^2.1.1
- path: ^1.8.3
- cupertino_icons: ^1.0.2