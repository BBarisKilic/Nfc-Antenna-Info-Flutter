import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/src/method_channel_nfc_antenna_info_flutter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const kPlatformName = 'platformName';

  group('$MethodChannelNfcAntennaInfoFlutter', () {
    late MethodChannelNfcAntennaInfoFlutter methodChannelNfcAntennaInfoFlutter;
    final log = <MethodCall>[];

    setUp(() async {
      methodChannelNfcAntennaInfoFlutter = MethodChannelNfcAntennaInfoFlutter();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        methodChannelNfcAntennaInfoFlutter.methodChannel,
        (methodCall) async {
          log.add(methodCall);
          switch (methodCall.method) {
            case 'getPlatformName':
              return kPlatformName;
            default:
              return null;
          }
        },
      );
    });

    tearDown(log.clear);

    test('getPlatformName', () async {
      final platformName = await methodChannelNfcAntennaInfoFlutter.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(platformName, equals(kPlatformName));
    });
  });
}
