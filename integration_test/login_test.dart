import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_app_diptsv3_todo/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify response login',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.text('No existe informacion de Usuario'), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('login');

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // do something to wait for 2 seconds
      await Future.delayed(const Duration(seconds: 4), (){});
      
      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('ucb@diplomado.com'), findsOneWidget);
    });
  });
}