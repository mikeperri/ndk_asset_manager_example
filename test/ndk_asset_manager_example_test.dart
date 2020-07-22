import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ndk_asset_manager_example/ndk_asset_manager_example.dart';

void main() {
  const MethodChannel channel = MethodChannel('ndk_asset_manager_example');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await NdkAssetManagerExample.platformVersion, '42');
  });
}
