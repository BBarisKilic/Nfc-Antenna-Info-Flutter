// Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.

/// A Flutter plugin to get the NFC antenna information on Android. Provided
/// information makes it possible to locate the NFC antenna on the device.
///
/// This plugin is currently supporting on Android and requires minimum Android
/// API level 34 (Android 14 - Upside Down Cake).
///
/// Get started at [https://pub.dev/packages/nfc_antenna_info_flutter].
library nfc_antenna_info_flutter;

export 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart'
    show NfcAntenna, NfcAntennaResponse;

export 'src/exceptions/exceptions.dart';
export 'src/nfc_antenna_info.dart';
