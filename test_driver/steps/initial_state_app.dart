import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:test/test.dart';

import '../pages/login_page.dart';

StepDefinitionGeneric initialStateOfApp() {
  return given<FlutterWorld>(
    'I test the initial state of the app',
    (context) async {
       LoginPage loginPage = LoginPage(context.world.driver!);
       context.expectMatch(await loginPage.getDefaultTextValue(), "No existe informacion de Usuario");
    },
  );
}