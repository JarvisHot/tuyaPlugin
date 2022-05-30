import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tuya_plugin/tuya_plugin_method_channel.dart';

void main() {
  MethodChannelTuyaPlugin platform = MethodChannelTuyaPlugin();
  const MethodChannel channel = MethodChannel('tuya_plugin');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}
