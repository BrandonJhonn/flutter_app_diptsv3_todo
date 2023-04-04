import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/click_a_button.dart';
import 'steps/element_is_absent.dart';
import 'steps/fill_a_textfield.dart';
import 'steps/see_if_value_is.dart';
import 'steps/set_invalid_credentials_login.dart';
import 'steps/set_valid_credentials_login.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r'test_driver/features/project.feature')]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report/report.json')
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
    ..stepDefinitions = [
      setValidCredencialsLogin(), 
      setInvalidCredencialsLogin(),
      fillATextField(),
      clickAButton(), 
      seeIfValueIs(),
      elementIsAbsent()
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/bdd.dart";
    // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
  return GherkinRunner().execute(config);
}