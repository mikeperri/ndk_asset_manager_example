#include <memory>
#include <string>
#include <jni.h>
#include <android/asset_manager.h>
#include <android/asset_manager_jni.h>
#include <android/log.h>

#define EXPORT extern "C" __attribute__((visibility("default"))) __attribute__((used))

AAssetManager *assetManager;

// Store a reference to the asset manager in the native module.
EXPORT void JNICALL
Java_com_example_ndk_1asset_1manager_1example_NdkAssetManagerExamplePlugin_setupAssetManager(
    JNIEnv *env, jobject instance, jobject jAssetManager) {

    assetManager = AAssetManager_fromJava(env, jAssetManager);

    if (assetManager == nullptr) {
        __android_log_print(ANDROID_LOG_ERROR, "NDK_ASSET_MANAGER_EXAMPLE", "Could not load assetManager");
        return;
    }

    __android_log_print(ANDROID_LOG_INFO, "NDK_ASSET_MANAGER_EXAMPLE", "Successfully set asset manager in native module");
}

// Use the asset manager to log the content of an example asset.
EXPORT
void logAssetContents() {
    if (assetManager == nullptr) {
        __android_log_print(ANDROID_LOG_ERROR, "NDK_ASSET_MANAGER_EXAMPLE", "Native code needs to get assetManager");
        return;
    }

    // Open asset. Analyzing the APK might be helpful for finding the correct path.
    AAsset *exampleAsset = AAssetManager_open(assetManager, "flutter_assets/packages/ndk_asset_manager_example/assets/example.txt", AASSET_MODE_BUFFER);

    // Get asset length
    auto assetLength = AAsset_getLength(exampleAsset);

    // Allocate memory to read asset contents into
    auto contents = std::make_unique<char[]>(assetLength + 1);

    // Read asset contents
    AAsset_read(exampleAsset, contents.get(), assetLength);

    // Log asset contents
    __android_log_print(ANDROID_LOG_INFO, "NDK_ASSET_MANAGER_EXAMPLE", "Example asset contents: %s", contents.get());
}
