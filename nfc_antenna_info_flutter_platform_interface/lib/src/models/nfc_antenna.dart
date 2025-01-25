import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// {@template nfc_antenna}
/// Represents a single available Nfc antenna on an Android device.
/// {@endtemplate}
class NfcAntenna extends Equatable {
  /// {@macro nfc_antenna}
  const NfcAntenna({
    required this.locationX,
    required this.locationY,
  });

  /// Converts the [Map] to an [NfcAntenna].
  @internal
  factory NfcAntenna.fromMap(Map<String, dynamic> map) {
    return NfcAntenna(
      locationX: map['locationX'] as int,
      locationY: map['locationY'] as int,
    );
  }

  /// Location of the antenna on the X axis in millimeters. 0 is the bottom-left
  /// when the user is facing the screen and the device orientation is Portrait.
  final int locationX;

  /// Location of the antenna on the Y axis in millimeters. 0 is the bottom-left
  /// when the user is facing the screen and the device orientation is Portrait.
  final int locationY;

  @override
  List<Object?> get props => [locationX, locationY];
}
