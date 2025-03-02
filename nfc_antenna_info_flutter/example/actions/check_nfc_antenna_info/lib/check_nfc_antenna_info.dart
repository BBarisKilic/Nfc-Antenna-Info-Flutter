import 'package:check_nfc_antenna_info/check_nfc_antenna_info.dart';
import 'package:fluttium/fluttium.dart';

export 'src/check_nfc_antenna_info.dart';

/// Will be executed by Fluttium on startup.
void register(Registry registry) {
  registry.registerAction('checkNfcAntennaInfo', CheckNfcAntennaInfo.new);
}
