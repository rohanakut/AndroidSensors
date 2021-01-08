import 'dart:async';

import 'package:flutter/services.dart';

class AndroidSensors {
  static const MethodChannel _channel = const MethodChannel('androidSensors');
  static const EventChannel _eventChannel = const EventChannel('sensorData');
  static Stream<double> sendValue;

  static Future<List<double>> get typeGameReading async {
    final List<dynamic> versionList =
        await _channel.invokeMethod('getTypeGameValue');
    double version = 5, version1, version2;
    versionList.map((e) => print(e));
    print(versionList.length);
    version = versionList[0];
    version1 = versionList[1];
    version2 = versionList[2];
    print("{$version},{$version1},{$version2}");
    print("the version is $version");
    return [version, version1, version2];
  }

  static Future<String> get initialiseTypeGameSensorFunc async {
    final String isInitialised =
        await _channel.invokeMethod('initialiseTypeGameSensor');
    return isInitialised;
  }

  static Future<String> get initialiseGravitySensorFunc async {
    final String isInitialised =
        await _channel.invokeMethod('initialiseGravitySensor');
    return isInitialised;
  }

  static Future<List<double>> get gravityReading async {
    final List<dynamic> versionList =
        await _channel.invokeMethod('getGravityValue');
    double version = 5, version1, version2;
    versionList.map((e) => print(e));
    print(versionList.length);
    version = versionList[0];
    version1 = versionList[1];
    version2 = versionList[2];
    print("{$version},{$version1},{$version2}");
    print("the version is $version");
    return [version, version1, version2];
  }

  static Future<String> get initialiseAccelerometerSensorFunc async {
    final String isInitialised =
        await _channel.invokeMethod('initialiseAccelerometerSensor');
    return isInitialised;
  }

  static Future<List<double>> get accelerometerReading async {
    final List<dynamic> versionList =
        await _channel.invokeMethod('getAccelerometerValue');
    double version = 5, version1, version2;
    versionList.map((e) => print(e));
    print(versionList.length);
    version = versionList[0];
    version1 = versionList[1];
    version2 = versionList[2];
    print("{$version},{$version1},{$version2}");
    print("the version is $version");
    return [version, version1, version2];
  }

  static Future<String> get initialiseGyroscopeSensorFunc async {
    final String isInitialised =
        await _channel.invokeMethod('initialiseGyroscopeSensor');
    return isInitialised;
  }

  static Future<List<double>> get gyroscopeReading async {
    final List<dynamic> versionList =
        await _channel.invokeMethod('getGyroscopeValue');
    double version = 5, version1, version2;
    versionList.map((e) => print(e));
    print(versionList.length);
    version = versionList[0];
    version1 = versionList[1];
    version2 = versionList[2];
    print("{$version},{$version1},{$version2}");
    print("the version is $version");
    return [version, version1, version2];
  }

  static Future<String> get initialiseLinearAccelerationSensorFunc async {
    final String isInitialised =
        await _channel.invokeMethod('initialiseLinearAccelerationSensor');
    return isInitialised;
  }

  static Future<List<double>> get linearAccelerationReading async {
    final List<dynamic> versionList =
        await _channel.invokeMethod('getLinearAccelerationValue');
    double version = 5, version1, version2;
    versionList.map((e) => print(e));
    print(versionList.length);
    version = versionList[0];
    version1 = versionList[1];
    version2 = versionList[2];
    print("{$version},{$version1},{$version2}");
    print("the version is $version");
    return [version, version1, version2];
  }

  static Future<String> get initialiseTypeRotationSensorFunc async {
    final String isInitialised =
        await _channel.invokeMethod('initialiseTypeRotationSensor');
    return isInitialised;
  }

  static Future<List<double>> get typeRotationReading async {
    final List<dynamic> versionList =
        await _channel.invokeMethod('getTypeRotationValue');
    double version = 5, version1, version2;
    versionList.map((e) => print(e));
    print(versionList.length);
    version = versionList[0];
    version1 = versionList[1];
    version2 = versionList[2];
    print("{$version},{$version1},{$version2}");
    print("the version is $version");
    return [version, version1, version2];
  }

  static Future<String> get initialiseStepCounterSensorFunc async {
    final String isInitialised =
        await _channel.invokeMethod('initialiseStepCounterSensor');
    return isInitialised;
  }

  static Future<List<double>> get stepCounterReading async {
    final List<dynamic> versionList =
        await _channel.invokeMethod('getStepCounterValue');
    double version = 5;
    versionList.map((e) => print(e));
    print(versionList.length);
    version = versionList[0];
    print("the version is $version");
    return [version];
  }

  static Future<String> get initialiseLightSensorFunc async {
    final String isInitialised =
        await _channel.invokeMethod('initialiseLightSensor');
    return isInitialised;
  }

  static Future<List<double>> get lightReading async {
    final List<dynamic> versionList =
        await _channel.invokeMethod('getLightValue');
    double version = 5;
    versionList.map((e) => print(e));
    print(versionList.length);
    version = versionList[0];
    print("the version is $version");
    return [version];
  }

  static Stream<double> get sensorData {
    if (sendValue == null) {
      sendValue = _eventChannel.receiveBroadcastStream().map((event) => event);
    }
    return sendValue;
  }
}
