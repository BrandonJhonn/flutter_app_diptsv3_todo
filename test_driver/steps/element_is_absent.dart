import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/login_page.dart';

StepDefinitionGeneric elementIsAbsent() {
  return then1<String, FlutterWorld>(
    'I see if the control {string} is absent',
    (key, context) async {
      final locator = find.byValueKey(key);
      bool actual = await FlutterDriverUtils.isAbsent(context.world.driver, locator);
      context.expectMatch(actual, true);
    },
  );
}