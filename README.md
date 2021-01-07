# Android Sensors

This plugin contains implementation of all the sensors mentioned [here](https://developer.android.com/guide/topics/sensors/sensors_overview). There are a few sensors namely:
1. Pressure Sensor
2. Relative Humidity Sensor
3. Temperature Sensor 

that have not been implemented in his package. This is because most of the mobile devices do not have these sensors. If in case an implementation of these sensors is required kindly raise an issue and I will adrress the same. 

Currently the sensors give a single value as an output. I am working on giving our streams of sensor values and it will be given in the susequent versions. 
In order to get the sensor values first initialise the sensor. **The sensor needs to be initialised only once.**
Once the sensor is initialised the value can be accessed at any time. 

Things to be completed in the subsequent Versions:
1. Implement the stream for every sensor
2. Provide sensor implementation for iOS.

# Importing the package 




