import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';

final class NfcAntennaInfoFlutterMock extends NfcAntennaInfoFlutterPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<NfcDataState<String>> getPlatformName() async =>
      const NfcDataSuccess(mockPlatformName);

  @override
  Future<NfcDataState<NfcAntennaResponse>> getNfcAntennaInfo() {
    throw UnimplementedError();
  }
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
          equals(
            const NfcDataSuccess(NfcAntennaInfoFlutterMock.mockPlatformName),
          ),
        );
      });
    });
  });
}
