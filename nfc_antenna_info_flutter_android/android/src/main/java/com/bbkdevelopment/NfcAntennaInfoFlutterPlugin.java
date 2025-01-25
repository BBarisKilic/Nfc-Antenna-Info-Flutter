package com.bbkdevelopment;

import android.content.Context;
import android.nfc.NfcAntennaInfo;
import androidx.annotation.NonNull;
import com.bbkdevelopment.constants.CallMethods;
import com.bbkdevelopment.exceptions.NfcAntennaInfoFlutterPluginException;
import com.bbkdevelopment.models.NfcAntennaInfoWrapper;
import com.bbkdevelopment.services.NfcAntennaService;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * A Flutter plugin to retrieve NFC antenna information on Android devices. This plugin provides
 * methods to interact with the NFC hardware and obtain  details about the NFC antennas available on
 * the device.
 */
public class NfcAntennaInfoFlutterPlugin implements FlutterPlugin, MethodCallHandler {

  // The service to retrieve NFC antenna information.
  private final NfcAntennaService nfcAntennaService;

  // The method channel to communicate with the Flutter app.
  private MethodChannel channel;

  // The context of the application.
  private Context context;

  /**
   * Default constructor for the plugin.
   */
  public NfcAntennaInfoFlutterPlugin() {
    nfcAntennaService = new NfcAntennaService();
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(),
        "nfc_antenna_info_flutter_android");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case CallMethods.GET_PLATFORM_NAME:
        handleGetPlatformNameRequest(result);
        break;
      case CallMethods.GET_NFC_ANTENNA_INFO:
        handleGetNfcAntennaInfoRequest(result);
        break;
      default:
        handleUnknownRequest(result);
        break;
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  /**
   * Handles the get platform name request from the Flutter app.
   *
   * @param result The result to send back to the Flutter app.
   */
  private void handleGetPlatformNameRequest(Result result) {
    result.success("Android");
  }

  /**
   * Handles the get NFC antenna information request from the Flutter app.
   *
   * @param result The result to send back to the Flutter app.
   */
  private void handleGetNfcAntennaInfoRequest(Result result) {
    try {
      final NfcAntennaInfo nfcAntennaInfo = nfcAntennaService.getNfcAntennaInfo(context);
      final NfcAntennaInfoWrapper nfcAntennaInfoWrapper = new NfcAntennaInfoWrapper(nfcAntennaInfo);
      result.success(nfcAntennaInfoWrapper.toMap());
    } catch (NfcAntennaInfoFlutterPluginException exception) {
      result.error(exception.getErrorCode(), exception.getMessage(), exception);
    }
  }

  /**
   * Handles unknown requests from the Flutter app.
   *
   * @param result The result to send back to the Flutter app.
   */
  private void handleUnknownRequest(Result result) {
    result.notImplemented();
  }
}