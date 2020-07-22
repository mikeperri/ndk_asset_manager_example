#import "NdkAssetManagerExamplePlugin.h"
#if __has_include(<ndk_asset_manager_example/ndk_asset_manager_example-Swift.h>)
#import <ndk_asset_manager_example/ndk_asset_manager_example-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ndk_asset_manager_example-Swift.h"
#endif

@implementation NdkAssetManagerExamplePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNdkAssetManagerExamplePlugin registerWithRegistrar:registrar];
}
@end
