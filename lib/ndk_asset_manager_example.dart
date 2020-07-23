import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ndk_asset_manager_example/native_bridge.dart';

class NdkAssetManagerExample {
  static const MethodChannel _channel =
      const MethodChannel('ndk_asset_manager_example');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void setupAssetManager() async {
    await _channel.invokeMethod('setupAssetManager');
  }

  static void logAssetContents() async {
    nLogAssetContents();
  }
}
