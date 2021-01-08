## all_mobile_sensors

This plugin contains implementation of all the Android Sensors available [here](https://developer.android.com/guide/topics/sensors). There are a few sensors in this list that I have not implemented. This is because these sensors are mostly not available on a mobile device. However, if the implementation is needed raise an issue so that I can do the same. The sensors not implemented are:

1. Relative Humidity
2. Pressure Sensor
3. Temperature Sensor

**Note: Currently this plugin serves only android devices and iOS version is still under progress.**

## Getting Started

In order to use this package add "" in the pubspec.yaml.

## How to use individual sensors
Currently the implementation of sensors does not support streams. This means continuous sensor values cannot be obtained for a particular sensor. However to obtain the individual values of a sensor perform the following steps:
1. Initialise the sensor (the initialisation has to be done just **once)**
2. Once the sensor is initialised you can get the values of a sensor.

## Demo
For example if I want to get the values of accelerometer just once I would perform the following steps:
1. Call the function initialiseAccelerometerSensorFunc present in the AllMobileSensor class. Once the sensor is initialised we can get its values whenever we want.
2. To get the values of the sensor call the function accelerometerReading present in AllMobileSensor class. We will get three values for the accelerometer sensor.

Refer example for further explanation. **To get a list of all sensor functions refer to the file named SensorActivities**

## Things to be completed
1. Add Streams for every sensor
2. Complete the iOS implementation for the plugin
