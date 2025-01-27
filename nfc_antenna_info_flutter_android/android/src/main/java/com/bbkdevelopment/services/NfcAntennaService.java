package com.bbkdevelopment.services;

import android.content.Context;
import android.nfc.AvailableNfcAntenna;
import android.nfc.NfcAdapter;
import android.nfc.NfcAntennaInfo;
import android.os.Build;
import com.bbkdevelopment.exceptions.NfcAntennaInfoFlutterPluginException;
import com.bbkdevelopment.exceptions.NfcDisabledException;
import com.bbkdevelopment.exceptions.NfcUnavailableException;
import com.bbkdevelopment.exceptions.UnsupportedFeatureException;
import java.util.ArrayList;
import java.util.List;

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
   * @throws NfcAntennaInfoFlutterPluginException If an error occurs while retrieving the NFC
   *                                              adapter.
   * @throws NfcUnavailableException              If NFC is not supported on the device.
   */
  public NfcAntennaInfo getNfcAntennaInfo(Context context) {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
      throw new UnsupportedFeatureException();
    }

    // Check if the device is an emulator and return a mock NFC antenna information object.
    if (isEmulator()) {
      return getMockNfcAntennaInfo();
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

  /**
   * Checks if the device is an emulator.
   *
   * @return True if the device is an emulator, otherwise false.
   */
  private Boolean isEmulator() {
    return (Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic"))
        || Build.FINGERPRINT.startsWith("generic")
        || Build.FINGERPRINT.startsWith("unknown")
        || Build.HARDWARE.contains("goldfish")
        || Build.HARDWARE.contains("ranchu")
        || Build.MODEL.contains("google_sdk")
        || Build.MODEL.contains("Emulator")
        || Build.MODEL.contains("Android SDK built for x86")
        || Build.MANUFACTURER.contains("Genymotion")
        || Build.PRODUCT.contains("sdk")
        || Build.PRODUCT.contains("vbox86p")
        || Build.PRODUCT.contains("emulator")
        || Build.PRODUCT.contains("simulator");
  }

  /**
   * Retrieves a mock NFC antenna information object for testing purposes.
   *
   * @return A mock NFC antenna information object.
   */
  private NfcAntennaInfo getMockNfcAntennaInfo() {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
      throw new UnsupportedFeatureException();
    }

    final List<AvailableNfcAntenna> mockAvailableNfcAntennas = new ArrayList<>();
    mockAvailableNfcAntennas.add(new AvailableNfcAntenna(33, 97));
    return new NfcAntennaInfo(68, 136, false, mockAvailableNfcAntennas);
  }
}
