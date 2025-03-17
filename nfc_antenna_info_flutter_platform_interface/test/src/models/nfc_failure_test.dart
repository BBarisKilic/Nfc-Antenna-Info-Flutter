// Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';

void main() {
  group('$NfcFailure', () {
    test('supports value equality', () {
      const failure1 = NfcFailure(
        '1',
        message: 'Exception message',
        details: 'Exception details',
      );
      const failure2 = NfcFailure(
        '1',
        message: 'Exception message',
        details: 'Exception details',
      );

      expect(failure1, equals(failure2));
      expect(
        failure1.props,
        equals(['1', 'Exception message', 'Exception details']),
      );
    });
  });
}
