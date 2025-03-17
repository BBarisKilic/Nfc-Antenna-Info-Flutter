// Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';

void main() {
  group('$NfcDataState', () {
    test('supports value equality', () {
      const response1 = NfcDataSuccess<String>('Hello');
      const response2 = NfcDataSuccess<String>('Hello');

      expect(response1, equals(response2));
      expect(response1.props, equals(['Hello', null]));
    });
  });

  group('$NfcDataSuccess', () {
    test('has data', () {
      const success = NfcDataSuccess<String>('Hello');

      expect(success.data, equals('Hello'));
    });
  });

  group('$NfcDataFailure', () {
    test('has code, message, details', () {
      const failure = NfcDataFailure<String>(
        NfcFailure(
          '1',
          message: 'Exception message',
          details: 'Exception details',
        ),
      );

      expect(failure.code, equals('1'));
      expect(failure.message, equals('Exception message'));
      expect(failure.details, equals('Exception details'));
    });
  });
}
