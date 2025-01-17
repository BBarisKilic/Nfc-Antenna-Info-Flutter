package com.bbkdevelopment.exceptions;

/**
 * An exception that is thrown when NFC is disabled on the device.
 */
public final class NfcDisabledException extends NfcAntennaInfoFlutterPluginException {

  // The error message for the exception.
  private static final String NFC_DISABLED_MESSAGE = "NFC is disabled on this device.";

  /**
   * Default constructor for the exception.
   */
  public NfcDisabledException() {
    super(NFC_DISABLED_MESSAGE, "3");
  }

}
