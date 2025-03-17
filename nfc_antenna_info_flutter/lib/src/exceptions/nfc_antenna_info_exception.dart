// Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.

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

/// {@template unsupported_feature_exception}
/// An exception that is thrown when the requested feature is not supported.
/// {@endtemplate}
final class UnsupportedFeatureException extends NfcAntennaInfoException {
  /// {@macro unsupported_feature_exception}
  const UnsupportedFeatureException([String? message]) : super(code, message);

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
