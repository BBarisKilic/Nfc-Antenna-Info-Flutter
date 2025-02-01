import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

export 'src/constants/constants.dart';
export 'src/method_channel_nfc_antenna_info_flutter.dart';
export 'src/models/models.dart';

/// The interface that implementations of nfc_antenna_info_flutter must
/// implement.
///
/// Platform implementations should extend this class rather than implement it
/// as `NfcAntennaInfoFlutter`. Extending this class (using `extends`) ensures
/// that the subclass will get the default implementation, while platform
/// implementations that `implements` this interface will be broken by newly
/// added [NfcAntennaInfoFlutterPlatform] methods.
abstract class NfcAntennaInfoFlutterPlatform extends PlatformInterface {
  /// Constructs a NfcAntennaInfoFlutterPlatform.
  NfcAntennaInfoFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static NfcAntennaInfoFlutterPlatform _instance =
      MethodChannelNfcAntennaInfoFlutter();

  /// The default instance of [NfcAntennaInfoFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelNfcAntennaInfoFlutter].
  static NfcAntennaInfoFlutterPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [NfcAntennaInfoFlutterPlatform] when they register
  /// themselves.
  static set instance(NfcAntennaInfoFlutterPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Gets the platform name.
  ///
  /// Returns the platform name as [String] wrapped in a [NfcDataSuccess] on
  /// success.
  ///
  /// In case of failure returns a [NfcFailure] with the error code and other
  /// details wrapped in a [NfcDataFailure].
  ///
  /// Possible error codes and their possible meanings:
  /// - `1`: Failed to get platform name.
  Future<NfcDataState<String>> getPlatformName();

  /// Gets the NFC antenna info.
  ///
  /// Returns the NFC antenna info as [NfcAntennaResponse] wrapped in a
  /// [NfcDataSuccess] on success.
  ///
  /// In case of failure returns a [NfcFailure] with the error code and other
  /// details wrapped in a [NfcDataFailure].
  ///
  /// Possible error codes and their possible meanings:
  /// - `1`: The new NFC API to get the NFC antenna info is not supported on
  /// this device.
  /// - `2`: NFC is not supported on this device.
  /// - `3`: NFC is not enabled on this device.
  Future<NfcDataState<NfcAntennaResponse>> getNfcAntennaInfo();
}
