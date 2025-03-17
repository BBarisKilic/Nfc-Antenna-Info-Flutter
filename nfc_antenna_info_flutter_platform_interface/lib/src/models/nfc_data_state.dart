// Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:nfc_antenna_info_flutter_platform_interface/nfc_antenna_info_flutter_platform_interface.dart';

/// {@template data_state}
/// A state that represents the state of the data.
/// {@endtemplate}
sealed class NfcDataState<T> extends Equatable {
  /// {@macro data_state}
  const NfcDataState({T? data, NfcFailure? failure})
      : _data = data,
        _failure = failure;

  /// The data.
  final T? _data;

  /// The failure.
  final NfcFailure? _failure;

  @override
  List<Object?> get props => [_data, _failure];
}

/// {@template data_success}
/// A state that represents the state of the data when the data is successful.
/// {@endtemplate}
final class NfcDataSuccess<T> extends NfcDataState<T> {
  /// {@macro data_success}
  const NfcDataSuccess(T data) : super(data: data);

  /// The data.
  T get data => _data!;
}

/// {@template data_failure}
/// A state that represents the state of the data when the data is a failure.
/// {@endtemplate}
final class NfcDataFailure<T> extends NfcDataState<T> {
  /// {@macro data_failure}
  const NfcDataFailure(NfcFailure failure) : super(failure: failure);

  /// The error code.
  String get code => _failure!.code;

  /// A human-readable error message, possibly null.
  String? get message => _failure!.message;

  /// Error details, possibly null.
  dynamic get details => _failure!.details;
}
