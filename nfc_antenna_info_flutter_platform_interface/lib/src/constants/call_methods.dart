import 'package:meta/meta.dart';

/// {@template call_methods}
/// Utility class that contains constants for the method names used in the
/// method channels.
/// {@endtemplate}
@internal
abstract interface class CallMethods {
  /// Method name to get the platform name.
  static const String getPlatformName = 'getPlatformName';

  /// Method name to get the NFC antenna information.
  static const String getNfcAntennaInfo = 'getNfcAntennaInfo';
}
