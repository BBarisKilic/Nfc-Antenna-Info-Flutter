package com.bbkdevelopment.services;

import android.content.Context;
import android.nfc.NfcAdapter;
import android.nfc.NfcAntennaInfo;
import android.os.Build;
import com.bbkdevelopment.exceptions.NfcAntennaInfoFlutterPluginException;
import com.bbkdevelopment.exceptions.NfcDisabledException;
import com.bbkdevelopment.exceptions.NfcUnavailableException;
import com.bbkdevelopment.exceptions.UnsupportedFeatureException;

/**
 * A service to retrieve NFC antenna information on Android devices. This service provides methods
 * to interact with the NFC hardware and obtain details about the NFC antennas available on the
 * device.
 */
public final class NfcAntennaService {

  /**
   * Retrieves the NFC antenna information from the device.
   *
   * @param context The context of the application.
   * @return The NFC antenna information if available, otherwise null.
   */
  public NfcAntennaInfo getNfcAntennaInfo(Context context) {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
      throw new UnsupportedFeatureException();
    }

    try {
      final NfcAdapter nfcAdapter = NfcAdapter.getDefaultAdapter(context);
      if (nfcAdapter == null) {
        throw new NfcUnavailableException();
      }
      if (!nfcAdapter.isEnabled()) {
        throw new NfcDisabledException();
      }
      return nfcAdapter.getNfcAntennaInfo();
    } catch (NfcAntennaInfoFlutterPluginException exception) {
      throw exception;
    } catch (Exception exception) {
      throw new NfcUnavailableException();
    }
  }
}
