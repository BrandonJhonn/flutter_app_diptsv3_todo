import 'package:flutter_driver/flutter_driver.dart';

class LoginPage {

  final defaultTextFinder = find.byValueKey('default-text');
  final emailTextFinder = find.byValueKey('email-text');
  final btnLogin = find.byValueKey('login');

  late FlutterDriver _driver;

  LoginPage(FlutterDriver driver) {
    _driver = driver;
  }

  Future<String> getEmailTextValue() async {
    return await _driver.getText(emailTextFinder);
  }

  Future<String> getDefaultTextValue() async {
    return await _driver.getText(defaultTextFinder);
  }

  Future<void> clickBtnLogin() async {
    await _driver.tap(btnLogin);
  }
}