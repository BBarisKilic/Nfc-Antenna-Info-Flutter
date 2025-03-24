# nfc_antenna_info_flutter_platform_interface

A common platform interface for the [nfc_antenna_info_flutter][nfc_antenna_info_flutter_link] plugin.

This interface allows platform-specific implementations of the `nfc_antenna_info_flutter` plugin, as
well as the plugin itself, to ensure they are supporting the same interface.

# Usage

To implement a new platform-specific implementation of `nfc_antenna_info_flutter`, extend
`NfcAntennaInfoFlutterPlatform` with an implementation that performs the platform-specific behavior.

[nfc_antenna_info_flutter_link]: https://pub.dev/packages/nfc_antenna_info_flutter