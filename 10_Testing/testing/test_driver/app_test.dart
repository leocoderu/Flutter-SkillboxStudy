import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver!.close();
      }
    });

    final filedFinderEmail = find.byValueKey('fieldEmail');
    final filedFinderPhone = find.byValueKey('fieldPhone');
    final filedFinderSubmit = find.byValueKey('butSend');

    // Сценарий теста Email
    test('Test email field', () async {
      await driver!.tap(filedFinderEmail);                  // Нажимаем на поле
      await driver!.waitFor(find.text(''));                 // Ожидаем пустое поле
      await driver!.enterText('hope@msn.com');              // Вводим адрес test@test.com
      await driver!.waitFor(find.text('hope@msn.com'));     // Ожидаем поле с введеным адресом
    });

    // Сценарий теста Phone
    test('Test email field', () async {
      await driver!.tap(filedFinderPhone);                  // Нажимаем на поле
      await driver!.waitFor(find.text(''));                 // Ожидаем пустое поле
      await driver!.enterText('simpleText');                // Вводим недопустимые символы
      await driver!.waitFor(find.text(''));                 // Ожидаем пустое поле
      await driver!.enterText('88002002002');               // Вводим номер телефона
      await driver!.waitFor(find.text('88002002002'));      // Ожидаем поле с введеным номером
    });

    // Сценарий теста нажатия на кнопку
    test('Test button Submit', () async {
      await driver!.tap(filedFinderSubmit);                 // Нажимаем на кнопку
    });

    // Сценарий получения необходимого результата
    test('You have done enter', () async {
      await driver!.waitFor(find.text('Добро пожаловать'));
    });

  });

  group('Register form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver!.close();
      }
    });

    final filedFinderFName = find.byValueKey('fieldNameFirst');
    final filedFinderSName = find.byValueKey('fieldNameSecond');
    final filedFinderEmail = find.byValueKey('fieldEmail');
    final filedFinderPhone = find.byValueKey('fieldPhone');
    final filedFinderSubmit = find.byValueKey('butSend');
    final filedFinderSwitch = find.byValueKey('butSwitch');

    // Сценарий теста переключения на панель регистрации
    test('Test button Submit', () async {
      await driver!.tap(filedFinderSwitch);                 // Нажимаем на кнопку
    });

    // Сценарий теста FirstName
    test('Test email field', () async {
      await driver!.tap(filedFinderFName);                  // Нажимаем на поле
      await driver!.waitFor(find.text(''));                 // Ожидаем пустое поле
      await driver!.enterText('charlotte');                 // Вводим имя charlotte
      await driver!.waitFor(find.text('charlotte'));        // Ожидаем поле с введеным именем
    });

    // Сценарий теста Second Name
    test('Test email field', () async {
      await driver!.tap(filedFinderSName);                  // Нажимаем на поле
      await driver!.waitFor(find.text(''));                 // Ожидаем пустое поле
      await driver!.enterText('hope');                      // Вводим фамилию
      await driver!.waitFor(find.text('hope'));             // Ожидаем поле с фамилией
    });

    // Сценарий теста Email
    test('Test email field', () async {
      await driver!.tap(filedFinderEmail);                  // Нажимаем на поле
      await driver!.waitFor(find.text(''));                 // Ожидаем пустое поле
      await driver!.enterText('hope@msn.com');              // Вводим адрес test@test.com
      await driver!.waitFor(find.text('hope@msn.com'));     // Ожидаем поле с введеным адресом
    });

    // Сценарий теста Phone
    test('Test email field', () async {
      await driver!.tap(filedFinderPhone);                  // Нажимаем на поле
      await driver!.waitFor(find.text(''));                 // Ожидаем пустое поле
      await driver!.enterText('simpleText');                // Вводим недопустимые символы
      await driver!.waitFor(find.text(''));                 // Ожидаем пустое поле
      await driver!.enterText('88002002002');               // Вводим номер телефона
      await driver!.waitFor(find.text('88002002002'));      // Ожидаем поле с введеным номером
    });

    // Сценарий теста нажатия на кнопку
    test('Test button Submit', () async {
      await driver!.tap(filedFinderSubmit);                 // Нажимаем на кнопку
    });

    // Сценарий получения необходимого результата
    test('You have done register successful', () async {
      await driver!.waitFor(find.text('Вы успешно зарегистрировались'));
    });
  });
}
