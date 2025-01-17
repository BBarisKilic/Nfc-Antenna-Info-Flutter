import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';

class NfcAntennaInfoFlutterMock extends NfcAntennaInfoFlutterPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String?> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('NfcAntennaInfoFlutterPlatformInterface', () {
    late NfcAntennaInfoFlutterPlatform nfcAntennaInfoFlutterPlatform;

    setUp(() {
      nfcAntennaInfoFlutterPlatform = NfcAntennaInfoFlutterMock();
      NfcAntennaInfoFlutterPlatform.instance = nfcAntennaInfoFlutterPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await NfcAntennaInfoFlutterPlatform.instance.getPlatformName(),
          equals(NfcAntennaInfoFlutterMock.mockPlatformName),
        );
      });
    });
  });
}
