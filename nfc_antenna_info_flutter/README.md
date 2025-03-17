# nfc_antenna_info_flutter

<div align="center">

[![nfc_antenna_info_flutter][build_status_badge]][workflow_link]
![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

</div>

A [Flutter][flutter_dev_link] plugin for retrieving precise NFC antenna information to accurately
locate NFC chips on Android 14 and newer devices.

<div align="center">

|         | Android | iOS |
|---------|---------|-----|
| Support | SDK 34+ | ❌   |

<img src="https://github.com/BBarisKilic/Nfc-Antenna-Info-Flutter/blob/main/nfc_antenna_info_flutter/art/nfc_antenna_info_flutter_gif_1.gif?raw=true" width="300">

Developed with 💙 by [BBK Development][bbk_development_link]

</div>

## Features

Provides a straightforward API to gather detailed information about all available NFC antennas on
Android devices. It also delivers device-specific details relevant to the positioning of antennas.

## Public Methods

| Return Type                  | Method Name         | Description                       | Throws                                                                                                                                                                                                            |
|------------------------------|---------------------|-----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Future<`NfcAntennaResponse`> | `getNfcAntennaInfo` | Gets the NFC antenna information. | - `UnsupportedFeatureException` if the platform does not support feature. <br> - `NfcUnavailableException` if NFC is not available on the device. <br> - `NfcDisabledException` if NFC is disabled on the device. |

#### Parameters of the `NfcAntennaResponse`:

| Type               | Parameter Name         | Description                               |
|--------------------|------------------------|-------------------------------------------|
| int                | `deviceWidth`          | Width of the device in millimeters.       |
| int                | `deviceHeight`         | Height of the device in millimeters.      |
| bool               | `deviceFoldable`       | Whether the device is foldable.           |
| List<`NfcAntenna`> | `availableNfcAntennas` | All available Nfc Antennas on the device. |

#### Parameters of the `NfcAntenna`:

| Type | Parameter Name | Description                                                                                                                                        |
|------|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| int  | `locationX`    | Location of the antenna on the X axis in millimeters. 0 is the top-left when the user is facing the screen and the device orientation is Portrait. |
| int  | `locationY`    | Location of the antenna on the Y axis in millimeters. 0 is the top-left when the user is facing the screen and the device orientation is Portrait. |

## Example

More examples can be found in `/example` folder on [GitHub][nfc_antenna_info_flutter_github_link].

## Feature requests and bugs

Please file feature requests and bugs at the [issue tracker][nfc_antenna_info_flutter_issue_link].

## Maintainers

- [Bulent Baris Kilic][maintainer_one_link]

[build_status_badge]: https://github.com/BBarisKilic/Nfc-Antenna-Info-Flutter/actions/workflows/nfc_antenna_info_flutter.yaml/badge.svg

[workflow_link]: https://github.com/BBarisKilic/Nfc-Antenna-Info-Flutter/actions/workflows/nfc_antenna_info_flutter.yaml

[coverage_badge]: coverage_badge.svg

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg

[license_link]: https://opensource.org/licenses/MIT

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg

[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

[bbk_development_link]: https://github.com/BBKDevelopment

[flutter_dev_link]: https://flutter.dev/

[nfc_antenna_info_flutter_github_link]: https://github.com/BBarisKilic/Nfc-Antenna-Info-Flutter/tree/main/nfc_antenna_info_flutter

[nfc_antenna_info_flutter_issue_link]: https://github.com/BBarisKilic/Nfc-Antenna-Info-Flutter/issues

[maintainer_one_link]: https://github.com/BBarisKilic