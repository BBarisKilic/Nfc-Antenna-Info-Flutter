/*
 * Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that
 * can be found in the LICENSE file.
 */

package com.bbkdevelopment.exceptions;

/**
 * An exception that is thrown when a feature is not supported on the device.
 */
public final class UnsupportedFeatureException extends NfcAntennaInfoFlutterPluginException {

  // The error message for the exception.
  private static final String UNSUPPORTED_FEATURE_MESSAGE =
      "This feature is not supported on this device.";

  /**
   * Default constructor for the exception.
   */
  public UnsupportedFeatureException() {
    super(UNSUPPORTED_FEATURE_MESSAGE, "1");
  }
}
