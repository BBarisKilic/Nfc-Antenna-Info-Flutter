import 'package:equatable/equatable.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/src/models/nfc_antenna.dart';

/// {@template nfc_antenna_response}
/// A response containing information about the [NfcAntenna]s available on the
/// device to help locate the NFC antenna.
/// {@endtemplate}
class NfcAntennaResponse extends Equatable {
  /// {@macro nfc_antenna_response}
  const NfcAntennaResponse({
    required this.deviceWidth,
    required this.deviceHeight,
    required this.deviceFoldable,
    required this.availableNfcAntennas,
  });

  /// Converts the [Map] to an [NfcAntennaResponse].
  factory NfcAntennaResponse.fromMap(Map<String, dynamic> map) {
    return NfcAntennaResponse(
      deviceWidth: map['deviceWidth'] as int,
      deviceHeight: map['deviceHeight'] as int,
      deviceFoldable: map['deviceFoldable'] as bool,
      availableNfcAntennas: (map['availableNfcAntennas'] as List)
          .map(
            (e) => switch (e) {
              final Map<dynamic, dynamic> map =>
                NfcAntenna.fromMap(map.cast<String, dynamic>()),
              _ => null,
            },
          )
          .nonNulls
          .toList(),
    );
  }

  /// Width of the device in millimeters.
  final int deviceWidth;

  /// Height of the device in millimeters.
  final int deviceHeight;

  /// Whether the device is foldable.
  final bool deviceFoldable;

  /// All available Nfc Antennas on the device.
  final List<NfcAntenna> availableNfcAntennas;

  @override
  List<Object?> get props =>
      [deviceWidth, deviceHeight, deviceFoldable, availableNfcAntennas];
}
