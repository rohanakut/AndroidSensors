## all_mobile_sensors
A flutter plugin that enables easy access to all android sensors. The user just has to run a simple function to get the senor values. This plugin enables the user to bypass the native platform specific code and get the sensor value easily for their application.

This plugin contains implementation of all the Android Sensors available [here](https://developer.android.com/guide/topics/sensors). There are a few sensors in this list that have not been implemented. This is because these sensors are mostly not available on a mobile device. However, if the implementation is needed raise an issue so that I can do the same. The sensors not implemented are:

1. Relative Humidity
2. Pressure Sensor
3. Temperature Sensor

**Note: Currently this plugin serves only android devices and iOS version is still under progress.**

## Getting Started

In order to use this package add "all_mobile_sensors" in the pubspec.yaml.
Import the package as mentioned below:

```import 'package:all_mobile_sensors/all_mobile_sensors.dart'```

## How to use individual sensors
For example if I want to get the values of accelerometer perform the following steps:
1. Call the function initialiseAccelerometerSensorFunc present in the AllMobileSensor class. Once the sensor is initialised we can get its values whenever we want.
2. To get the values of the sensor call the function accelerometerReading present in AllMobileSensor class. We will get three values for the accelerometer sensor.

Refer example to see the exact implementation for other sensors.

 **To get a list of all sensor functions refer to the file named SensorActivities.txt or refer the functions listed in AllMobileSensors.dart**

## Things expected in future versions
1. Streams for every sensor
2. iOS implementation for the plugin
