<h1 align="center">About</h1>

# Run project
## - Android, iOS:
```sh
flutter run lib/main.dart
```

## - Windows:
```sh
flutter run -d chrome --web-renderer html
```

<br />

# Run sorting imports
```sh
flutter pub run import_sorter:main
```

<br />

# Generate files
#### Models and etc.:
```sh
flutter packages pub run build_runner build --delete-conflicting-outputs
```

<br />

# Модуль 17. Firebase

#### Задание

1. Создать приложение со списком покупок. В списке должно быть наименование покупки и признак, куплено или нет. В списоке можно пометить покупку, как купленную.

2. Создать свой проект в Firebase, подключить его к Android, iOS, Web.

3. Создайть базу данных со списком покупок и подключить её к приложению.

4. Добавить картинку из Firebase Storage.

5. Добавить аутентификацию пользователя через любого провайдера.

6. Использовать в приложении какой-либо подход из State Management, работу с Firebase вынести на сервисный слой.
