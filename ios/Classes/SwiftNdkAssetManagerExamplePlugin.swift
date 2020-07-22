import Flutter
import UIKit

public class SwiftNdkAssetManagerExamplePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ndk_asset_manager_example", binaryMessenger: registrar.messenger())
    let instance = SwiftNdkAssetManagerExamplePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
