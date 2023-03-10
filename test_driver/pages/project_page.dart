import 'package:flutter_driver/flutter_driver.dart';

class ProjectPage {

  final cardProjectIdFinder = find.byValueKey('card-detail');
  final btnEditFinder = find.byValueKey('btn-edit');
  final btnDeleteFinder = find.byValueKey('btn-delete');
  final inputContentFinder = find.byValueKey('frm-user');
  final btnSaveFinder = find.byValueKey('btn-save');

  late FlutterDriver _driver;

  ProjectPage(FlutterDriver driver) {
    _driver = driver;
  }

  Future<void> clickBtnCardProject() async {
    await _driver.tap(cardProjectIdFinder);
  }

  Future<void> clickBtnEdit() async {
    await _driver.tap(btnEditFinder);
  }

  Future<void> clickBtnDelete() async {
    await _driver.tap(btnDeleteFinder);
  }

  Future<void> setContentInputText(String vStrContent) async {
    await _driver.tap(inputContentFinder);
    await _driver.enterText(vStrContent);
    return await _driver.waitFor(find.text(vStrContent));
  }

  Future<void> clickBtnSave() async {
    await _driver.tap(btnSaveFinder);
  }
}