import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testing/views/login_view.dart';

void main() {
  testWidgets('Login View Tests', (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(
          home: LoginView()
        )
    );

    // Проверяем наличие полей и отсутствие текста о входе
    expect(find.byKey(const Key('fieldEmail')), findsOneWidget);
    expect(find.byKey(const Key('fieldPhone')), findsOneWidget);
    expect(find.byKey(const Key('butSend')), findsOneWidget);
    expect(find.text('Добро пожаловать'), findsNothing);

    // Заполняем поля данными
    await tester.enterText(find.byKey(const Key('fieldEmail')), 'hope@msn.com');
    expect(find.text('hope@msn.com'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('fieldPhone')), '88002002002');
    expect(find.text('88002002002'), findsOneWidget);

    // Нажимаем отправить данные
    await tester.tap(find.byKey(const Key('butSend')));
    await tester.pump();

    // Ожидаемый результат
    expect(find.text('Добро пожаловать'), findsOneWidget);
  });
}
