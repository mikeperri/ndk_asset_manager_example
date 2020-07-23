import 'dart:ffi';
import 'dart:io';

final DynamicLibrary nativeLib =
  Platform.isAndroid
    ? DynamicLibrary.open('libndk_asset_manager_example.so')
    : throw("Only implemented for Android");

final nLogAssetContents =
  nativeLib
    .lookupFunction<
      Void Function(),
      void Function()
    >('logAssetContents');
