import 'package:nfc_antenna_info_flutter_platform_interface/src/method_channel_nfc_antenna_info_flutter.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of nfc_antenna_info_flutter must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `NfcAntennaInfoFlutter`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [NfcAntennaInfoFlutterPlatform] methods.
abstract class NfcAntennaInfoFlutterPlatform extends PlatformInterface {
  /// Constructs a NfcAntennaInfoFlutterPlatform.
  NfcAntennaInfoFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static NfcAntennaInfoFlutterPlatform _instance = MethodChannelNfcAntennaInfoFlutter();

  /// The default instance of [NfcAntennaInfoFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelNfcAntennaInfoFlutter].
  static NfcAntennaInfoFlutterPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [NfcAntennaInfoFlutterPlatform] when they register themselves.
  static set instance(NfcAntennaInfoFlutterPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String?> getPlatformName();
}
