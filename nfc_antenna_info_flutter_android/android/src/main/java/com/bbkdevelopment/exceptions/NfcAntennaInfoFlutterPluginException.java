/*
 * Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that
 * can be found in the LICENSE file.
 */

package com.bbkdevelopment.exceptions;

/**
 * An exception that is thrown when an error occurs in the NfcAntennaInfoFlutterPlugin.
 */
public class NfcAntennaInfoFlutterPluginException extends RuntimeException {

  // The error code for the exception.
  private final String errorCode;

  /**
   * Constructor for the exception.
   *
   * @param message   The error message for the exception.
   * @param errorCode The error code for the exception.
   */
  public NfcAntennaInfoFlutterPluginException(String message, String errorCode) {
    super(message);
    this.errorCode = errorCode;
  }

  /**
   * Gets the error code for the exception.
   *
   * @return The error code for the exception.
   */
  public String getErrorCode() {
    return errorCode;
  }
}
