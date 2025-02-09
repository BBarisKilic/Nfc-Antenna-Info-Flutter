import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nfc_antenna_info_flutter_example/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('E2E', () {
    testWidgets('getNfcAntennaInfo', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.text('Get NFC Antenna Location'));
      await tester.pumpFrames(
        const app.MyApp(),
        const Duration(seconds: 1),
      );
      final expectedWidget = find.byIcon(Icons.nfc);
      await tester.ensureVisible(expectedWidget);
    });
  });
}
