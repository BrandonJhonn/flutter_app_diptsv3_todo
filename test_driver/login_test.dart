import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('login test', () {
    
    final defaultTextFinder = find.byValueKey('default-text');
    final emailTextFinder = find.byValueKey('email-text');
    final btnLogin = find.byValueKey('login');

    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test('User login in the TODO web service test', () async {

      await driver.tap(btnLogin);
      await driver.waitForAbsent(defaultTextFinder, timeout: const Duration(seconds: 4));
      expect(await driver.getText(emailTextFinder), "ucb@diplomado.com");

    });

  });
}