# FLUTTER APP TODO

A Flutter project to use BDD as Metology to Develope an APP with TODO Public Services.
This Project is as a result from the curse "TESTING DE SOFTWARE V3" getting from Catolica University.

## Todo App

![image](https://user-images.githubusercontent.com/66140035/224333627-8a0270e0-1ad4-43c2-a127-9de072ec3032.png)

- TODO APP is based on [Todo.ly](https://todo.ly/) web services

## Getting Started

1. Clone this project (https://github.com/BrandonJhonn/flutter_app_diptsv3_todo.git)
2. After you must run:

```
flutter pub get
flutter run
```

3. To run the test scenaries, you must run:

```
flutter driver --target=test_driver/bdd.dart
```

4. To run the report with node (Yo could edit the metadata in "index.js" file):

- Install [cucumber-html-reporter](https://www.npmjs.com/package/cucumber-html-reporter)

```
npm i cucumber-html-reporter
```

- Run the report

```
cd report
node index.js
```

## Content

- Example of use [flutter_gherkin](https://pub.dev/packages/flutter_gherkin) package

![image](https://user-images.githubusercontent.com/66140035/229657149-0ac0b4aa-1b26-435a-9aff-98905567f219.png)

- A generic classes to run steps to describe the scenaries

![image](https://user-images.githubusercontent.com/66140035/229657671-36068b94-a896-45c4-9828-bdf5ffbb3343.png)

- Example of runner to execute a suite of test with Cucumber in Flutter

![image](https://user-images.githubusercontent.com/66140035/229657499-2bbf6346-5441-461c-ac04-3d8c6f16a316.png)

- A report to review the results

![image](https://user-images.githubusercontent.com/66140035/229658046-9e46075c-0586-4c21-a58d-3fa8bafafc1e.png)


## Aditional

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## References

- [Flutter Gherkin](https://pub.dev/packages/flutter_gherkin)
- [Cucumber](https://cucumber.io/docs/cucumber/)
