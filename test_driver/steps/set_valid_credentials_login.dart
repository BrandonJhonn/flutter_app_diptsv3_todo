import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:test/test.dart';

import '../pages/login_page.dart';

StepDefinitionGeneric setValidCredencialsLogin() {
  return given<FlutterWorld>(
    'I set a valid credencials in login page',
    (context) async {
       LoginPage loginPage = LoginPage(context.world.driver!);
       await loginPage.setUserInputText("user");
       await loginPage.setPasswordInputText("password");
       context.expectMatch(await loginPage.getTextResult(), "");
    },
  );
}