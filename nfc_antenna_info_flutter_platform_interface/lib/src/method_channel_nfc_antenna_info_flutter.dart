// Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';

/// An implementation of [NfcAntennaInfoFlutterPlatform] that uses method
/// channels.
final class MethodChannelNfcAntennaInfoFlutter
    extends NfcAntennaInfoFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel(MethodChannels.nfcAntennaInfoFlutter);

  @override
  Future<NfcDataState<String>> getPlatformName() async {
    try {
      final response =
          await methodChannel.invokeMethod<String>(CallMethods.getPlatformName);
      if (response == null) {
        return const NfcDataFailure(
          NfcFailure('1', message: 'Failed to get platform name'),
        );
      }
      return NfcDataSuccess(response);
    } on PlatformException catch (e) {
      return NfcDataFailure(NfcFailure(e.code, message: e.message, details: e));
    } on MissingPluginException catch (e) {
      return NfcDataFailure(
        NfcFailure('1', message: 'Platform is not supported', details: e),
      );
    }
  }

  @override
  Future<NfcDataState<NfcAntennaResponse>> getNfcAntennaInfo() async {
    try {
      final response = await methodChannel
          .invokeMapMethod<String, dynamic>(CallMethods.getNfcAntennaInfo);
      if (response == null) {
        return const NfcDataFailure(
          NfcFailure('1', message: 'Failed to get NFC antenna info'),
        );
      }
      return NfcDataSuccess(NfcAntennaResponse.fromMap(response));
    } on PlatformException catch (e) {
      return NfcDataFailure(NfcFailure(e.code, message: e.message, details: e));
    } on MissingPluginException catch (e) {
      return NfcDataFailure(
        NfcFailure('1', message: 'Platform is not supported', details: e),
      );
    }
  }
}
