import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:all_mobile_sensors/all_mobile_sensors.dart';

void main() {
  const MethodChannel channel = MethodChannel('all_mobile_sensors');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await AllMobileSensors.platformVersion, '42');
  // });
}
