import 'package:meta/meta.dart';
import 'package:nfc_antenna_info_flutter/nfc_antenna_info_flutter.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';

/// {@template nfc_antenna_info}
/// [NfcAntennaInfo] provides functionalities to get NFC information on the
/// device to help locate the NFC antenna.
/// {@endtemplate}
final class NfcAntennaInfo {
  /// {@macro nfc_antenna_info}
  const NfcAntennaInfo();

  NfcAntennaInfoFlutterPlatform get _platform =>
      NfcAntennaInfoFlutterPlatform.instance;

  /// Returns `String` representing the platform name.
  ///
  /// Throws:
  /// - [UnsupportedNfcFeatureException] if the platform does not support NFC.
  /// - [UnknownNfcException] if the unknown platform error occurs.
  @visibleForTesting
  Future<String> getPlatformName() async {
    final NfcDataState<String> state;
    try {
      state = await _platform.getPlatformName();
    } catch (_) {
      throw const UnknownNfcException('Failed to get platform name');
    }

    switch (state) {
      case final NfcDataSuccess<String> nfcDataSuccess:
        return nfcDataSuccess.data;
      case final NfcDataFailure<String> nfcDataFailure:
        switch (nfcDataFailure.code) {
          case UnsupportedNfcFeatureException.code:
            throw UnsupportedNfcFeatureException(nfcDataFailure.message);
          default:
            throw UnknownNfcException(nfcDataFailure.message);
        }
    }
  }

  /// Returns [NfcAntennaResponse] representing the NFC antenna information.
  ///
  /// Throws:
  /// - [UnsupportedNfcFeatureException] if the platform does not support NFC.
  /// - [NfcUnavailableException] if NFC is not available on the device.
  /// - [NfcDisabledException] if NFC is disabled on the device.
  /// - [UnknownNfcException] if the unknown platform error occurs.
  Future<NfcAntennaResponse> getNfcAntennaInfo() async {
    final NfcDataState<NfcAntennaResponse> state;
    try {
      state = await _platform.getNfcAntennaInfo();
    } catch (_) {
      throw const UnknownNfcException('Failed to get NFC antenna info');
    }

    switch (state) {
      case final NfcDataSuccess<NfcAntennaResponse> nfcDataSuccess:
        return nfcDataSuccess.data;
      case final NfcDataFailure<NfcAntennaResponse> nfcDataFailure:
        switch (nfcDataFailure.code) {
          case UnsupportedNfcFeatureException.code:
            throw UnsupportedNfcFeatureException(nfcDataFailure.message);
          case NfcUnavailableException.code:
            throw NfcUnavailableException(nfcDataFailure.message);
          case NfcDisabledException.code:
            throw NfcDisabledException(nfcDataFailure.message);
          default:
            throw UnknownNfcException(nfcDataFailure.message);
        }
    }
  }
}
