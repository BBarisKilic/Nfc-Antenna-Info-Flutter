import 'package:fluttium/fluttium.dart';

/// {@template check_nfc_antenna_info}
/// An action that checks if NFC Antenna location is visible.
/// {@endtemplate}
class CheckNfcAntennaInfo extends Action {
  /// {@macro check_nfc_antenna_info}
  const CheckNfcAntennaInfo();

  @override
  Future<bool> execute(Tester tester) async {
    return const ExpectVisible(
      text: 'Where to scan NFC tags effectively:',
    ).execute(tester);
  }

  @override
  String description() => 'Check NFC antenna info';
}
