import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/login_page.dart';

StepDefinitionGeneric fillATextField() {
  return and2<String, String, FlutterWorld>(
    'I fill the {string} field with {string}',
    (key, value, context) async {
      final locator = find.byValueKey(key);
      await FlutterDriverUtils.tap(context.world.driver, locator);
      await FlutterDriverUtils.enterText(context.world.driver, locator, value);
    },
  );
}