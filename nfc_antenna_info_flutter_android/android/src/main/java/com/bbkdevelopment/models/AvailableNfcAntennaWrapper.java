package com.bbkdevelopment.models;

import android.nfc.AvailableNfcAntenna;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import com.bbkdevelopment.exceptions.UnsupportedFeatureException;
import java.util.HashMap;
import java.util.Map;

/**
 * A wrapper class for the AvailableNfcAntenna object to convert it to a map.
 */
public final class AvailableNfcAntennaWrapper {

  // The key for the location on the X axis.
  private static final String LOCATION_X = "locationX";

  // The key for the location on the Y axis.
  private static final String LOCATION_Y = "locationY";

  // The AvailableNfcAntenna object to be wrapped.
  private final AvailableNfcAntenna availableNfcAntenna;

  /**
   * Default constructor for the wrapper.
   *
   * @param availableNfcAntenna The AvailableNfcAntenna object to be wrapped.
   */
  public AvailableNfcAntennaWrapper(AvailableNfcAntenna availableNfcAntenna) {
    this.availableNfcAntenna = availableNfcAntenna;
  }

  /**
   * Converts the AvailableNfcAntenna object to a map.
   *
   * @return The map representation of the AvailableNfcAntenna object.
   * @throws UnsupportedFeatureException If the feature is not supported on the device.
   */
  public Map<String, Object> toMap(int deviceHeight) {
    if (availableNfcAntenna == null) {
      return null;
    }
    if (VERSION.SDK_INT < VERSION_CODES.UPSIDE_DOWN_CAKE) {
      throw new UnsupportedFeatureException();
    }
    // The location on the Y axis is calculated by subtracting the location from the device height.
    // This is required because the location provided by the API is from the bottom-left when the
    // user is facing the screen, and the device orientation is in portrait mode but the Flutter
    // plugin expects the location from the top-left.
    final int locationY = deviceHeight - availableNfcAntenna.getLocationY();
    final Map<String, Object> availableNfcAntennaMap = new HashMap<>();
    availableNfcAntennaMap.put(LOCATION_X, availableNfcAntenna.getLocationX());
    availableNfcAntennaMap.put(LOCATION_Y, locationY);
    return availableNfcAntennaMap;
  }
}
