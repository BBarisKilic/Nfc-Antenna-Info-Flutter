// Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.

/// {@template call_methods}
/// Utility class that contains constants for the method names used in the
/// method channels.
/// {@endtemplate}
abstract interface class CallMethods {
  /// Method name to get the platform name.
  static const String getPlatformName = 'getPlatformName';

  /// Method name to get the NFC antenna information.
  static const String getNfcAntennaInfo = 'getNfcAntennaInfo';
}
