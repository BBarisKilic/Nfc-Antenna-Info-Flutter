import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';

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
          return switch (methodCall.method) {
            'getPlatformName' => kPlatformName,
            _ => null,
          };
        },
      );
    });

    tearDown(log.clear);

    test('getPlatformName', () async {
      final platformName =
          await methodChannelNfcAntennaInfoFlutter.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(platformName, equals(const NfcDataSuccess(kPlatformName)));
    });
  });
}
