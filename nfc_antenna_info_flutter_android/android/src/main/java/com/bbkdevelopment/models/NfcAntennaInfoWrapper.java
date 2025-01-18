package com.bbkdevelopment.models;

import android.nfc.NfcAntennaInfo;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import com.bbkdevelopment.exceptions.NfcUnavailableException;
import com.bbkdevelopment.exceptions.UnsupportedFeatureException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * A wrapper class for the NfcAntennaInfo object to convert it to a map.
 */
public final class NfcAntennaInfoWrapper {

  // The key for the device width.
  private static final String DEVICE_WIDTH = "deviceWidth";

  // The key for the device height.
  private static final String DEVICE_HEIGHT = "deviceHeight";

  // The key for the device foldable.
  private static final String DEVICE_FOLDABLE = "deviceFoldable";

  // The key for the available NFC antennas.
  private static final String AVAILABLE_NFC_ANTENNAS = "availableNfcAntennas";

  // The NfcAntennaInfo object to be wrapped.
  private final NfcAntennaInfo nfcAntennaInfo;

  /**
   * Default constructor for the wrapper.
   *
   * @param nfcAntennaInfo The NfcAntennaInfo object to be wrapped.
   */
  public NfcAntennaInfoWrapper(NfcAntennaInfo nfcAntennaInfo) {
    this.nfcAntennaInfo = nfcAntennaInfo;
  }

  /**
   * Converts the NfcAntennaInfo object to a map.
   *
   * @return The map representation of the NfcAntennaInfo object.
   * @throws NfcUnavailableException     If NFC is not supported on the device.
   * @throws UnsupportedFeatureException If the feature is not supported on the device.
   */
  public Map<String, Object> toMap() {
    if (nfcAntennaInfo == null) {
      return null;
    }
    if (VERSION.SDK_INT < VERSION_CODES.UPSIDE_DOWN_CAKE) {
      throw new UnsupportedFeatureException();
    }

    final List<Map<String, Object>> availableNfcAntennaMaps = nfcAntennaInfo
        .getAvailableNfcAntennas()
        .stream()
        .map(antenna -> new AvailableNfcAntennaWrapper(antenna).toMap())
        .filter(Objects::nonNull)
        .collect(Collectors.toList());
    if (availableNfcAntennaMaps.isEmpty()) {
      throw new NfcUnavailableException();
    }

    final Map<String, Object> nfcAntennaInfoMap = new HashMap<>();
    nfcAntennaInfoMap.put(DEVICE_WIDTH, nfcAntennaInfo.getDeviceWidth());
    nfcAntennaInfoMap.put(DEVICE_HEIGHT, nfcAntennaInfo.getDeviceHeight());
    nfcAntennaInfoMap.put(DEVICE_FOLDABLE, nfcAntennaInfo.isDeviceFoldable());
    nfcAntennaInfoMap.put(AVAILABLE_NFC_ANTENNAS, availableNfcAntennaMaps);
    return nfcAntennaInfoMap;
  }
}
