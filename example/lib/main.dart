import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:testandroidsensor2/testandroidsensor2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _platformVersion = 0.155;
  List<double> _sensorVersion;
  double typeGameValue1 = 0.0;
  double typeGameValue2 = 0.0;
  double typeGameValue3 = 0.0;

  @override
  void initState() {
    super.initState();
  }

  Future<String> initialiseTypeGameSensor() async {
    String isInitialised;
    await Testandroidsensor2.initialiseTypeGameSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  Future<String> initialiseGravitySensor() async {
    String isInitialised;
    await Testandroidsensor2.initialiseGravitySensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  Future<String> initialiseAccelerometerSensor() async {
    String isInitialised;
    await Testandroidsensor2.initialiseAccelerometerSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  Future<String> initialiseGyroscopeSensor() async {
    String isInitialised;
    await Testandroidsensor2.initialiseGyroscopeSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  Future<String> initialiseLinearAccelerationSensor() async {
    String isInitialised;
    await Testandroidsensor2.initialiseLinearAccelerationSensorFunc
        .then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  Future<String> initialiseTypeRotationSensor() async {
    String isInitialised;
    await Testandroidsensor2.initialiseTypeRotationSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  Future<String> initialiseStepCounterSensor() async {
    String isInitialised;
    await Testandroidsensor2.initialiseStepCounterSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  // Future<String> initialiseAmbientTemperatureSensor() async {
  //   String isInitialised;
  //   await Testandroidsensor2.initialiseAmbientTemperatureSensorFunc
  //       .then((value) {
  //     setState(() {
  //       isInitialised = value;
  //       print(isInitialised);
  //     });
  //   });
  // }

  Future<String> initialiseLightSensor() async {
    String isInitialised;
    await Testandroidsensor2.initialiseLightSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  // Future<String> initialiseTemperatureSensor() async {
  //   String isInitialised;
  //   await Testandroidsensor2.initialiseTemperatureSensorFunc.then((value) {
  //     setState(() {
  //       isInitialised = value;
  //       print(isInitialised);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // initSensorState();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
            child: Column(
                // child: Text('Running on: $_platformVersion\n'),
                children: <Widget>[
              Container(
                  child: typeGameValue1 == 0
                      ? Text("No data found")
                      : Text("$typeGameValue1")),
              Container(
                  child: typeGameValue2 == 0
                      ? Text("No data found")
                      : Text("$typeGameValue2")),
              Container(
                  child: typeGameValue3 == 0
                      ? Text("No data found")
                      : Text("$typeGameValue3")),
              StreamBuilder(
                  stream: Testandroidsensor2.sensorData,
                  builder:
                      (BuildContext context, AsyncSnapshot<double> snapshot) {
                    if (snapshot.hasData) {
                      return Text("The value is ${snapshot.data}");
                    }
                    return Text("No data");
                  }),

              //Container(child: Text("$typeGameValue")),
              RaisedButton(
                onPressed: () {
                  initialiseTypeGameSensor();
                },
                child: Text("Initialise Type Game Sensor"),
              ),
              RaisedButton(
                onPressed: () {
                  Testandroidsensor2.typeGameReading.then((value) {
                    setState(() {
                      typeGameValue1 = value[0];
                      typeGameValue2 = value[1];
                      typeGameValue3 = value[2];
                    });
                  });
                },
                child: Text("Get Type Game Value"),
              ),
              RaisedButton(
                  onPressed: () {
                    initialiseGravitySensor();
                  },
                  child: Text("initialise Gravity Sensor")),
              RaisedButton(
                onPressed: () {
                  Testandroidsensor2.gravityReading.then((value) {
                    setState(() {
                      typeGameValue1 = value[0];
                      typeGameValue2 = value[1];
                      typeGameValue3 = value[2];
                    });
                  });
                },
                child: Text("Get Gravity Value"),
              ),
              RaisedButton(
                  onPressed: () {
                    initialiseAccelerometerSensor();
                  },
                  child: Text("initialise Accelerometer Sensor")),
              RaisedButton(
                onPressed: () {
                  Testandroidsensor2.accelerometerReading.then((value) {
                    setState(() {
                      typeGameValue1 = value[0];
                      typeGameValue2 = value[1];
                      typeGameValue3 = value[2];
                    });
                  });
                },
                child: Text("Get Accelerometer Value"),
              ),
              RaisedButton(
                  onPressed: () {
                    initialiseGyroscopeSensor();
                  },
                  child: Text("initialise Gyroscope Sensor")),
              RaisedButton(
                onPressed: () {
                  Testandroidsensor2.gyroscopeReading.then((value) {
                    setState(() {
                      typeGameValue1 = value[0];
                      typeGameValue2 = value[1];
                      typeGameValue3 = value[2];
                    });
                  });
                },
                child: Text("Get Gyroscope Value"),
              ),
              RaisedButton(
                  onPressed: () {
                    initialiseLinearAccelerationSensor();
                  },
                  child: Text("initialise Linear Acceleration Sensor")),
              RaisedButton(
                onPressed: () {
                  Testandroidsensor2.linearAccelerationReading.then((value) {
                    setState(() {
                      typeGameValue1 = value[0];
                      typeGameValue2 = value[1];
                      typeGameValue3 = value[2];
                    });
                  });
                },
                child: Text("Get Linear Acceleration Value"),
              ),
              RaisedButton(
                  onPressed: () {
                    initialiseTypeRotationSensor();
                  },
                  child: Text("initialise Type Rotation Sensor")),
              RaisedButton(
                onPressed: () {
                  Testandroidsensor2.typeRotationReading.then((value) {
                    setState(() {
                      typeGameValue1 = value[0];
                      typeGameValue2 = value[1];
                      typeGameValue3 = value[2];
                    });
                  });
                },
                child: Text("Get Type Rotation Value"),
              ),
              RaisedButton(
                  onPressed: () {
                    initialiseStepCounterSensor();
                  },
                  child: Text("initialise Step Counter Sensor")),
              RaisedButton(
                onPressed: () {
                  Testandroidsensor2.stepCounterReading.then((value) {
                    setState(() {
                      typeGameValue1 = value[0];
                    });
                  });
                },
                child: Text("Get Step Counter Value"),
              ),
              // RaisedButton(
              //     onPressed: () {
              //       initialiseAmbientTemperatureSensor();
              //     },
              //     child: Text("initialise Ambient Temperature Sensor")),
              // RaisedButton(
              //   onPressed: () {
              //     Testandroidsensor2.ambientTemperatureReading.then((value) {
              //       setState(() {
              //         typeGameValue1 = value[0];
              //       });
              //     });
              //   },
              //   child: Text("Get Ambient Temperature Value"),
              // ),
              RaisedButton(
                  onPressed: () {
                    initialiseLightSensor();
                  },
                  child: Text("initialise Light Sensor")),
              RaisedButton(
                onPressed: () {
                  Testandroidsensor2.lightReading.then((value) {
                    setState(() {
                      typeGameValue1 = value[0];
                    });
                  });
                },
                child: Text("Get Light Value"),
              ),
              // RaisedButton(
              //     onPressed: () {
              //       initialiseTemperatureSensor();
              //     },
              //     child: Text("initialise Temperature Sensor")),
              // RaisedButton(
              //   onPressed: () {
              //     Testandroidsensor2.temperatureReading.then((value) {
              //       setState(() {
              //         typeGameValue1 = value[0];
              //       });
              //     });
              //   },
              //   child: Text("Get Temperature Value"),
              // ),
            ])),
      ),
    );
  }
}
