
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shopss/main.dart' as app;

void main(){
  group('App test', (){
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('login test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final registerLink = find.text('Register here');
      await tester.pumpAndSettle();

      await tester.tap(registerLink);
      await tester.pumpAndSettle();

      final name = find.byKey(Key('name'));
      final email = find.byKey(Key('email'));
      final phone = find.byKey(Key('phone'));
      final shop = find.byKey(Key('shop'));
      final password = find.byKey(Key('password'));
      final passwordConfirm = find.byKey(Key('confirm'));
      final buttonRegister = find.byType(RaisedButton).first;

      await tester.enterText(name, 'Aissatou Bella');
      await tester.enterText(email, 'bella2020@gmail.com');
      await tester.enterText(phone, '00223567895');
      await tester.enterText(shop, 'bellashop');
      await tester.enterText(password, 'bella12345');
      await tester.enterText(passwordConfirm, 'bella12345');
      await tester.pumpAndSettle();

      await tester.tap(buttonRegister);
      await tester.pumpAndSettle();
    });

    testWidgets('login user', (WidgetTester tester ) async{
      app.main();
      await tester.pumpAndSettle();

      final emailField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).last;
      final buttonLogin = find.byType(RaisedButton);
      await tester.pumpAndSettle();

      await tester.enterText(emailField, 'gando2020@gmail.com');
      await tester.enterText(passwordField, '12345678');
      await tester.pumpAndSettle();

      await tester.tap(buttonLogin);
      await tester.pumpAndSettle();


    });

    //testWidgets('')
  });
}