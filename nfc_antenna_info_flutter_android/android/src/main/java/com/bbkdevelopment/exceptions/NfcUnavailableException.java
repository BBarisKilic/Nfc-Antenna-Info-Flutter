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
