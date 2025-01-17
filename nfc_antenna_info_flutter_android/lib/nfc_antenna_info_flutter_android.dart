import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';

/// The Android implementation of [NfcAntennaInfoFlutterPlatform].
class NfcAntennaInfoFlutterAndroid extends NfcAntennaInfoFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('nfc_antenna_info_flutter_android');

  /// Registers this class as the default instance of [NfcAntennaInfoFlutterPlatform]
  static void registerWith() {
    NfcAntennaInfoFlutterPlatform.instance = NfcAntennaInfoFlutterAndroid();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
