import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_antenna_info_flutter_android/nfc_antenna_info_flutter_android.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NfcAntennaInfoFlutterAndroid', () {
    const kPlatformName = 'Android';
    late NfcAntennaInfoFlutterAndroid nfcAntennaInfoFlutter;
    late List<MethodCall> log;

    setUp(() async {
      nfcAntennaInfoFlutter = NfcAntennaInfoFlutterAndroid();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(nfcAntennaInfoFlutter.methodChannel,
              (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      NfcAntennaInfoFlutterAndroid.registerWith();
      expect(NfcAntennaInfoFlutterPlatform.instance,
          isA<NfcAntennaInfoFlutterAndroid>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await nfcAntennaInfoFlutter.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
