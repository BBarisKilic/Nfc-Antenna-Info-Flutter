import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nfc_antenna_info_flutter/nfc_antenna_info_flutter.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNfcAntennaInfoFlutterPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements NfcAntennaInfoFlutterPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NfcAntennaInfoFlutter', () {
    late NfcAntennaInfoFlutterPlatform nfcAntennaInfoFlutterPlatform;
    late NfcAntennaInfo nfcAntennaInfo;

    setUp(() {
      nfcAntennaInfoFlutterPlatform = MockNfcAntennaInfoFlutterPlatform();
      NfcAntennaInfoFlutterPlatform.instance = nfcAntennaInfoFlutterPlatform;
      nfcAntennaInfo = const NfcAntennaInfo();
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => nfcAntennaInfoFlutterPlatform.getPlatformName(),
        ).thenAnswer((_) async => const NfcDataSuccess(platformName));

        final actualPlatformName = await nfcAntennaInfo.getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test('throws exception when platform implementation is missing',
          () async {
        when(
          () => nfcAntennaInfoFlutterPlatform.getPlatformName(),
        ).thenAnswer((_) async => const NfcDataFailure(NfcFailure('')));

        expect(nfcAntennaInfo.getPlatformName, throwsException);
      });
    });
  });
}
