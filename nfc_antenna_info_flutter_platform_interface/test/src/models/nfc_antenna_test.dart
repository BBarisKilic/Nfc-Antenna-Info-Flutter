// Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';

void main() {
  group('$NfcAntenna', () {
    test('supports value equality', () {
      const response1 = NfcAntenna(locationX: 10, locationY: 20);
      const response2 = NfcAntenna(locationX: 10, locationY: 20);

      expect(response1, equals(response2));
      expect(response1.props, equals([10, 20]));
    });
  });
}
