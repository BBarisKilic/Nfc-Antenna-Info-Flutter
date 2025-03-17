/*
 * Copyright 2025 The NfcAntennaInfoFlutter Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that
 * can be found in the LICENSE file.
 */

package com.bbkdevelopment.constants;

/**
 * Utility class that contains constants for the method names used in the method channels.
 */
public final class CallMethods {

  // Method name to get the platform name.
  public static final String GET_PLATFORM_NAME = "getPlatformName";

  // Method name to get the NFC antenna information.
  public static final String GET_NFC_ANTENNA_INFO = "getNfcAntennaInfo";

  // Private constructor to prevent instantiation.
  private CallMethods() {
    throw new UnsupportedOperationException("This is a utility class and cannot be instantiated");
  }
}
