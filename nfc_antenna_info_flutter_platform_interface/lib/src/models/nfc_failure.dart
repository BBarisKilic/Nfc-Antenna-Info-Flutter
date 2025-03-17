// Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.

import 'package:equatable/equatable.dart';

/// {@template failure}
/// A class that represents a failure.
/// {@endtemplate}
final class NfcFailure extends Equatable {
  /// {@macro failure}
  const NfcFailure(
    this.code, {
    this.message,
    this.details,
  });

  /// An error code.
  final String code;

  /// A human-readable error message, possibly null.
  final String? message;

  /// Error details, possibly null.
  ///
  /// This property is `dynamic`, which means type-checking is skipped when
  /// accessing this property. To minimize the risk of type errors at runtime,
  /// the value should be cast to `Object?` when accessed.
  final dynamic details;

  @override
  List<Object?> get props => [code, message, details];
}
