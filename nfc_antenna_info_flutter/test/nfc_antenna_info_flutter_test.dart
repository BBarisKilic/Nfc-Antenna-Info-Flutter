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
          nfcAntennaInfoFlutterPlatform.getPlatformName,
        ).thenAnswer((_) async => const NfcDataSuccess(platformName));

        final actualPlatformName = await nfcAntennaInfo.getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test(
          'throws UnsupportedFeatureException when platform implementation is '
          'missing', () async {
        const exceptionMessage = 'Platform implementation is missing';
        when(
          () => nfcAntennaInfoFlutterPlatform.getPlatformName(),
        ).thenAnswer(
          (_) async =>
              const NfcDataFailure(NfcFailure('1', message: exceptionMessage)),
        );

        expect(
          nfcAntennaInfo.getPlatformName,
          throwsA(
            predicate(
              (exception) =>
                  exception is UnsupportedFeatureException &&
                  exception.message == exceptionMessage,
            ),
          ),
        );
      });
    });

    group('getNfcAntennaInfo', () {
      test(
          'returns correct NFC antenna info when platform implementation '
          'exists', () async {
        when(
          nfcAntennaInfoFlutterPlatform.getNfcAntennaInfo,
        ).thenAnswer(
          (_) async => const NfcDataSuccess(
            NfcAntennaResponse(
              deviceWidth: 720,
              deviceHeight: 1080,
              deviceFoldable: false,
              availableNfcAntennas: [],
            ),
          ),
        );

        final actualNfcAntennaInfo = await nfcAntennaInfo.getNfcAntennaInfo();
        expect(actualNfcAntennaInfo, isNotNull);
      });

      test(
          'throws UnsupportedFeatureException when platform implementation is '
          'missing', () async {
        const exceptionMessage = 'Platform implementation is missing';
        when(
          nfcAntennaInfoFlutterPlatform.getNfcAntennaInfo,
        ).thenAnswer(
          (_) async =>
              const NfcDataFailure(NfcFailure('1', message: exceptionMessage)),
        );

        expect(
          nfcAntennaInfo.getNfcAntennaInfo,
          throwsA(
            predicate(
              (exception) =>
                  exception is UnsupportedFeatureException &&
                  exception.message == exceptionMessage,
            ),
          ),
        );
      });

      test('throws NfcUnavailableException when NFC is unavailable', () async {
        const exceptionMessage = 'NFC feature is unavailable';
        when(
          nfcAntennaInfoFlutterPlatform.getNfcAntennaInfo,
        ).thenAnswer(
          (_) async =>
              const NfcDataFailure(NfcFailure('2', message: exceptionMessage)),
        );

        expect(
          nfcAntennaInfo.getNfcAntennaInfo,
          throwsA(
            predicate(
              (exception) =>
                  exception is NfcUnavailableException &&
                  exception.message == exceptionMessage,
            ),
          ),
        );
      });

      test('throws NfcDisabledException when NFC feature is disabled',
          () async {
        const exceptionMessage = 'NFC feature is disabled';
        when(
          nfcAntennaInfoFlutterPlatform.getNfcAntennaInfo,
        ).thenAnswer(
          (_) async =>
              const NfcDataFailure(NfcFailure('3', message: exceptionMessage)),
        );

        expect(
          nfcAntennaInfo.getNfcAntennaInfo,
          throwsA(
            predicate(
              (exception) =>
                  exception is NfcDisabledException &&
                  exception.message == exceptionMessage,
            ),
          ),
        );
      });
    });

    test('throws UnsupportedFeatureException when unknown error occurs',
        () async {
      const exceptionMessage = 'Unknown error';
      const exceptionToString = 'NfcAntennaInfoException: 1, $exceptionMessage';
      when(
        nfcAntennaInfoFlutterPlatform.getNfcAntennaInfo,
      ).thenAnswer(
        (_) async => const NfcDataFailure(
          NfcFailure('99', message: exceptionMessage),
        ),
      );

      expect(
        nfcAntennaInfo.getNfcAntennaInfo,
        throwsA(
          predicate(
            (exception) =>
                exception is UnsupportedFeatureException &&
                exception.toString() == exceptionToString,
          ),
        ),
      );
    });
  });
}
