/// {@template nfc_antenna_info_exception}
/// An exception that is thrown when the `NfcAntennaInfo` fails.
/// {@endtemplate}
sealed class NfcAntennaInfoException implements Exception {
  /// {@macro nfc_antenna_info_exception}
  const NfcAntennaInfoException(String code, String? message)
      : _code = code,
        _message = message;

  final String _code;
  final String? _message;

  @override
  String toString() => 'NfcAntennaInfoException: $_code, $_message';
}

/// {@template unsupported_nfc_feature_exception}
/// An exception that is thrown when the requested NFC feature is not supported.
/// {@endtemplate}
final class UnsupportedNfcFeatureException extends NfcAntennaInfoException {
  /// {@macro unsupported_nfc_feature_exception}
  const UnsupportedNfcFeatureException([String? message])
      : super(code, message);

  /// The error code.
  static const String code = '1';

  /// A human-readable error message, possibly null.
  String? get message => _message;
}

/// {@template nfc_unavailable_exception}
/// An exception that is thrown when the NFC is unavailable.
/// {@endtemplate}
final class NfcUnavailableException extends NfcAntennaInfoException {
  /// {@macro nfc_unavailable_exception}
  const NfcUnavailableException([String? message]) : super(code, message);

  /// The error code.
  static const String code = '2';

  /// A human-readable error message, possibly null.
  String? get message => _message;
}

/// {@template nfc_disabled_exception}
/// An exception that is thrown when the NFC is disabled.
/// {@endtemplate}
final class NfcDisabledException extends NfcAntennaInfoException {
  /// {@macro nfc_disabled_exception}
  const NfcDisabledException([String? message]) : super(code, message);

  /// The error code.
  static const String code = '3';

  /// A human-readable error message, possibly null.
  String? get message => _message;
}

/// {@template unknown_nfc_exception}
/// An exception that is thrown when the NFC issue is unknown.
/// {@endtemplate}
final class UnknownNfcException extends NfcAntennaInfoException {
  /// {@macro unknown_nfc_exception}
  const UnknownNfcException([String? message]) : super(code, message);

  /// The error code.
  static const String code = '4';

  /// A human-readable error message, possibly null.
  String? get message => _message;
}
