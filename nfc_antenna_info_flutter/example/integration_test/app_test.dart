import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nfc_antenna_info_flutter_example/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('E2E', () {
    testWidgets('getPlatformName', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.text('Get Platform Name'));
      await tester.pumpAndSettle();
      final expectedPlatform = expectedPlatformName();
      final expectedWidget = find.byWidgetPredicate((widget) {
        return switch (widget) {
          Text(data: final String text) =>
            text.startsWith('Platform Name: $expectedPlatform'),
          _ => false,
        };
      });
      await tester.ensureVisible(expectedWidget);
    });
  });
}

String expectedPlatformName() {
  if (Platform.isAndroid) return 'Android';
  throw UnsupportedError('Unsupported platform ${Platform.operatingSystem}');
}
