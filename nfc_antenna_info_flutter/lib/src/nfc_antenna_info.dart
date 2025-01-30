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
  /// - [UnsupportedFeatureException] if the platform does not support feature.
  @visibleForTesting
  Future<String> getPlatformName() async {
    final state = await _platform.getPlatformName();
    switch (state) {
      case final NfcDataSuccess<String> nfcDataSuccess:
        return nfcDataSuccess.data;
      case final NfcDataFailure<String> nfcDataFailure:
        throw UnsupportedFeatureException(nfcDataFailure.message);
    }
  }

  /// Returns [NfcAntennaResponse] representing the NFC antenna information.
  ///
  /// Throws:
  /// - [UnsupportedFeatureException] if the platform does not support feature.
  /// - [NfcUnavailableException] if NFC is not available on the device.
  /// - [NfcDisabledException] if NFC is disabled on the device.
  Future<NfcAntennaResponse> getNfcAntennaInfo() async {
    final state = await _platform.getNfcAntennaInfo();
    switch (state) {
      case final NfcDataSuccess<NfcAntennaResponse> nfcDataSuccess:
        return nfcDataSuccess.data;
      case final NfcDataFailure<NfcAntennaResponse> nfcDataFailure:
        switch (nfcDataFailure.code) {
          case UnsupportedFeatureException.code:
            throw UnsupportedFeatureException(nfcDataFailure.message);
          case NfcUnavailableException.code:
            throw NfcUnavailableException(nfcDataFailure.message);
          case NfcDisabledException.code:
            throw NfcDisabledException(nfcDataFailure.message);
          default:
            throw UnsupportedFeatureException(nfcDataFailure.message);
        }
    }
  }
}
