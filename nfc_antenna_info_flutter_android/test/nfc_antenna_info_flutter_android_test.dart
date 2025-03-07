import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_antenna_info_flutter_android/nfc_antenna_info_flutter_android.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NfcAntennaInfoFlutterAndroid', () {
    const kPlatformName = 'Android';
    late NfcAntennaInfoFlutterAndroid nfcAntennaInfoFlutter;
    final log = <MethodCall>[];

    setUp(() async {
      nfcAntennaInfoFlutter = NfcAntennaInfoFlutterAndroid();
    });

    tearDown(log.clear);

    test('can be registered', () {
      NfcAntennaInfoFlutterAndroid.registerWith();
      expect(
        NfcAntennaInfoFlutterPlatform.instance,
        isA<NfcAntennaInfoFlutterAndroid>(),
      );
    });

    test('getPlatformName returns correct name', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(nfcAntennaInfoFlutter.methodChannel,
              (methodCall) async {
        log.add(methodCall);
        if (methodCall.method == 'getPlatformName') {
          return kPlatformName;
        }
        return null;
      });
      final state = await nfcAntennaInfoFlutter.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(state, equals(const NfcDataSuccess(kPlatformName)));
    });

    test('getPlatformName may end up with PlatformException failure', () async {
      const code = '2';
      const message = 'Failed to get platform name';
      final platformException = PlatformException(code: code, message: message);

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(nfcAntennaInfoFlutter.methodChannel,
              (methodCall) async {
        log.add(methodCall);
        if (methodCall.method == 'getPlatformName') {
          throw platformException;
        }
        return null;
      });
      final state = await nfcAntennaInfoFlutter.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(state, isA<NfcDataFailure<String>>());
      expect((state as NfcDataFailure<String>).code, equals(code));
    });

    test('getPlatformName may end up with MissingPluginException failure',
        () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(nfcAntennaInfoFlutter.methodChannel,
              (methodCall) async {
        log.add(methodCall);
        if (methodCall.method == 'getPlatformName') {
          throw MissingPluginException();
        }
        return null;
      });
      final state = await nfcAntennaInfoFlutter.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(state, isA<NfcDataFailure<String>>());
      expect((state as NfcDataFailure<String>).code, equals('1'));
    });

    test('getNfcAntennaInfo returns correct NFC antenna info', () async {
      final nfcAntennaResponseMap = <String, dynamic>{
        'deviceWidth': 100,
        'deviceHeight': 200,
        'deviceFoldable': true,
        'availableNfcAntennas': <Map<String, dynamic>>[
          <String, dynamic>{
            'locationX': 10,
            'locationY': 20,
          },
        ],
      };

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(nfcAntennaInfoFlutter.methodChannel,
              (methodCall) async {
        log.add(methodCall);
        if (methodCall.method == 'getNfcAntennaInfo') {
          return nfcAntennaResponseMap;
        }
        return null;
      });
      final state = await nfcAntennaInfoFlutter.getNfcAntennaInfo();
      expect(
        log,
        <Matcher>[isMethodCall('getNfcAntennaInfo', arguments: null)],
      );
      expect(
        state,
        isA<NfcDataSuccess<NfcAntennaResponse>>().having(
          (state) => state.data,
          'data',
          isA<NfcAntennaResponse>()
              .having(
                (response) => response.deviceWidth,
                'deviceWidth',
                equals(nfcAntennaResponseMap['deviceWidth'] as int),
              )
              .having(
                (response) => response.deviceHeight,
                'deviceHeight',
                equals(nfcAntennaResponseMap['deviceHeight'] as int),
              )
              .having(
                (response) => response.deviceFoldable,
                'deviceFoldable',
                equals(nfcAntennaResponseMap['deviceFoldable'] as bool),
              )
              .having(
                (response) => response.availableNfcAntennas,
                'availableNfcAntennas',
                hasLength(
                  equals(
                    (nfcAntennaResponseMap['availableNfcAntennas'] as List)
                        .length,
                  ),
                ),
              )
              .having(
                (response) => response.availableNfcAntennas.first,
                'availableNfcAntennas.first',
                isA<NfcAntenna>()
                    .having(
                      (antenna) => antenna.locationX,
                      'locationX',
                      equals(
                        (nfcAntennaResponseMap['availableNfcAntennas']
                                as List<Map<String, dynamic>>)
                            .first['locationX'] as int,
                      ),
                    )
                    .having(
                      (antenna) => antenna.locationY,
                      'locationY',
                      equals(
                        (nfcAntennaResponseMap['availableNfcAntennas']
                                as List<Map<String, dynamic>>)
                            .first['locationY'] as int,
                      ),
                    ),
              ),
        ),
      );
    });

    test('getNfcAntennaInfo may end up with PlatformException failure',
        () async {
      const code = '2';
      const message = 'Failed to get platform name';
      final platformException = PlatformException(code: code, message: message);

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(nfcAntennaInfoFlutter.methodChannel,
              (methodCall) async {
        log.add(methodCall);
        if (methodCall.method == 'getNfcAntennaInfo') {
          throw platformException;
        }
        return null;
      });
      final state = await nfcAntennaInfoFlutter.getNfcAntennaInfo();
      expect(
        log,
        <Matcher>[isMethodCall('getNfcAntennaInfo', arguments: null)],
      );
      expect(state, isA<NfcDataFailure<NfcAntennaResponse>>());
      expect((state as NfcDataFailure<NfcAntennaResponse>).code, equals(code));
    });

    test('getNfcAntennaInfo may end up with MissingPluginException failure',
        () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(nfcAntennaInfoFlutter.methodChannel,
              (methodCall) async {
        log.add(methodCall);
        if (methodCall.method == 'getNfcAntennaInfo') {
          throw MissingPluginException();
        }
        return null;
      });
      final state = await nfcAntennaInfoFlutter.getNfcAntennaInfo();
      expect(
        log,
        <Matcher>[isMethodCall('getNfcAntennaInfo', arguments: null)],
      );
      expect(state, isA<NfcDataFailure<NfcAntennaResponse>>());
      expect((state as NfcDataFailure<NfcAntennaResponse>).code, equals('1'));
    });
  });
}
