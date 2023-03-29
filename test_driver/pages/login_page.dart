import 'package:flutter_driver/flutter_driver.dart';

class LoginPage {

  final inputUserFinder = find.byValueKey('frm-user');
  final inputPasswordFinder = find.byValueKey('frm-password');
  final btnLogin = find.byValueKey('btn-login');

  late FlutterDriver _driver;

  LoginPage(FlutterDriver driver) {
    _driver = driver;
  }

  Future<void> clickBtnLogin() async {
    await _driver.tap(btnLogin);
  }

  Future<void> setUserInputText(String vStrUser) async {
    await _driver.tap(inputUserFinder);
    await _driver.enterText(vStrUser);
    return await _driver.waitFor(find.text(vStrUser));
  }

  Future<void> setPasswordInputText(String vStrPassword) async {
    await _driver.tap(inputPasswordFinder);
    await _driver.enterText(vStrPassword);
    return await _driver.waitFor(find.text(vStrPassword));
  }
}