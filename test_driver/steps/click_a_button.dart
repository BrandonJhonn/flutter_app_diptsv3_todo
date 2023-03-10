import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:test/test.dart';

import '../pages/login_page.dart';

StepDefinitionGeneric seeIfValueIS() {
  return when2<String, String, FlutterWorld>(
    'I see if the value in {string} is {string}',
    (key, expected, context) async {

      final locator = find.byValueKey(key);
      String actual = await FlutterDriverUtils.getText(context.world.driver!, locator);
      context.expectMatch(actual, expected);
    },
  );
}