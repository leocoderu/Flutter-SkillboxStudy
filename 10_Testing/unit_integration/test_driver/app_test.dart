import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group('Login test', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null){
        await driver!.close();
      }
    });

    final filedFinderEmail = find.byValueKey('fieldEmail');
    final filedFinderPhone = find.byValueKey('fieldPhone');
    final filedFinderSubmit = find.text('Submit');

    // Сценарий теста Email
    test('Test email field', () async {
      await driver!.tap(filedFinderEmail);                  // Нажимаем на поле
      await driver!.waitFor(find.text(''));                 // Ожидаем пустое поле
      await driver!.enterText('test@test.com');             // Вводим адрес test@test.com
      await driver!.waitFor(find.text('test@test.com'));    // Ожидаем поле с введеным адресом
    });

    // Сценарий теста Phone
    test('Test phone field', () async {
      await driver!.tap(filedFinderPhone);                  // Нажимаем на поле
      await driver!.waitFor(find.text(''));                 // Ожидаем пустое поле
      await driver!.enterText('88002002000');               // Вводим адрес test@test.com
      await driver!.waitFor(find.text('88002002000'));      // Ожидаем поле с введеным адресом
    });

    // Сценарий теста Phone
    test('Test button Submit', () async {
      await driver!.tap(filedFinderSubmit);                  // Нажимаем на поле
    });

    // Сценарий получения необходимого результата
    test('You have done register successful', () async {
      await driver!.waitFor(find.text('Вы успешно зарегистрировались'));

      //final success = find.text('Вы успешно зарегистрировались');
      //expect(await driver!.getText(success), 'Вы успешно зарегистрировались');
    });
  });
}