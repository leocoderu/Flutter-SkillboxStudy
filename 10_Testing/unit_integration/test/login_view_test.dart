import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_integration/views/login_view.dart';

void main(){
  testWidgets('Login View Tests', (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(
            home: LoginView(),
        )
    );

    expect(find.byKey(const Key('fieldEmail')), findsOneWidget);
    expect(find.byKey(const Key('fieldPhone')), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
    expect(find.text('Вы успешно зарегистрировались'), findsNothing);
    //expect(find.text('Submiter'), findsOneWidget);  Wrong test!

    await tester.enterText(find.byKey(const Key('fieldEmail')), 'test@test.com');
    expect(find.text('test@test.com'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('fieldPhone')), '1413123123123213');
    expect(find.text('1413123123123213'), findsOneWidget);

    await tester.tap(find.text('Submit'));
    await tester.pump();
    expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
  });
}