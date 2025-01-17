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
