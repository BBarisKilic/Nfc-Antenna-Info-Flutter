/*
 * Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that
 * can be found in the LICENSE file.
 */

package com.bbkdevelopment.exceptions;

/**
 * An exception that is thrown when NFC is not supported on the device.
 */
public final class NfcUnavailableException extends NfcAntennaInfoFlutterPluginException {

  // The error message for the exception.
  private static final String NFC_NOT_SUPPORTED_MESSAGE = "NFC is not supported on this device.";

  /**
   * Default constructor for the exception.
   */
  public NfcUnavailableException() {
    super(NFC_NOT_SUPPORTED_MESSAGE, "2");
  }
}
