import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:androidSensors/androidSensors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double typeGameValue1 = 0.0;
  double typeGameValue2 = 0.0;
  double typeGameValue3 = 0.0;

  @override
  void initState() {
    super.initState();
  }

  void initialiseTypeGameSensor() async {
    String isInitialised;
    await AndroidSensors.initialiseTypeGameSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  void initialiseGravitySensor() async {
    String isInitialised;
    await AndroidSensors.initialiseGravitySensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  void initialiseAccelerometerSensor() async {
    String isInitialised;
    await AndroidSensors.initialiseAccelerometerSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  void initialiseGyroscopeSensor() async {
    String isInitialised;
    await AndroidSensors.initialiseGyroscopeSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  void initialiseLinearAccelerationSensor() async {
    String isInitialised;
    await AndroidSensors.initialiseLinearAccelerationSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  void initialiseTypeRotationSensor() async {
    String isInitialised;
    await AndroidSensors.initialiseTypeRotationSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  void initialiseStepCounterSensor() async {
    String isInitialised;
    await AndroidSensors.initialiseStepCounterSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  void initialiseLightSensor() async {
    String isInitialised;
    await AndroidSensors.initialiseLightSensorFunc.then((value) {
      setState(() {
        isInitialised = value;
        print(isInitialised);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // initSensorState();
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Center(
            child: SingleChildScrollView(
                child: Column(
                    // child: Text('Running on: $_platformVersion\n'),
                    children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          height: 80,
                          width: 250,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurple.shade100,
                          ),
                          child: typeGameValue1 == 0
                              ? Text("No data found")
                              : Text(
                                  "The first value of sensor is: $typeGameValue1"))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      child: Container(
                          height: 80,
                          width: 250,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurple.shade100,
                          ),
                          child: typeGameValue2 == 0
                              ? Text("No data found")
                              : Text(
                                  "The second value of sensor is: $typeGameValue2"))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      child: Container(
                          height: 80,
                          width: 250,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurple.shade100,
                          ),
                          child: typeGameValue3 == 0
                              ? Text("No data found")
                              : Text(
                                  "The third value of sensor is: $typeGameValue3"))),
                  // StreamBuilder(
                  //     stream: AndroidSensors.sensorData,
                  //     builder:
                  //         (BuildContext context, AsyncSnapshot<double> snapshot) {
                  //       if (snapshot.hasData) {
                  //         return Text("The value is ${snapshot.data}");
                  //       }
                  //       return Text("No data");
                  //     }),

                  //Container(child: Text("$typeGameValue")),
                  SizedBox(
                      width: 300,
                      child: MaterialButton(
                        height: 40.0,
                        minWidth: 70.0,
                        color: Colors.green[100],
                        textColor: Colors.black,
                        onPressed: () {
                          initialiseTypeGameSensor();
                        },
                        child: Text("Initialise Type Game Sensor"),
                      )),
                  SizedBox(
                      width: 300,
                      child: MaterialButton(
                        height: 40.0,
                        minWidth: 70.0,
                        color: Colors.green[100],
                        textColor: Colors.black,
                        onPressed: () {
                          AndroidSensors.typeGameReading.then((value) {
                            setState(() {
                              typeGameValue1 = value[0];
                              typeGameValue2 = value[1];
                              typeGameValue3 = value[2];
                            });
                          });
                        },
                        child: Text("Get Type Game Value"),
                      )),
                  SizedBox(
                      width: 300,
                      child: MaterialButton(
                          height: 40.0,
                          minWidth: 70.0,
                          color: Colors.orange[100],
                          textColor: Colors.black,
                          onPressed: () {
                            initialiseGravitySensor();
                          },
                          child: Text("Initialise Gravity Sensor"))),
                  SizedBox(
                      width: 300,
                      child: MaterialButton(
                        height: 40.0,
                        minWidth: 70.0,
                        color: Colors.orange[100],
                        textColor: Colors.black,
                        onPressed: () {
                          AndroidSensors.gravityReading.then((value) {
                            setState(() {
                              typeGameValue1 = value[0];
                              typeGameValue2 = value[1];
                              typeGameValue3 = value[2];
                            });
                          });
                        },
                        child: Text("Get Gravity Value"),
                      )),
                  SizedBox(
                      width: 300,
                      child: MaterialButton(
                          height: 40.0,
                          minWidth: 70.0,
                          color: Colors.yellow[100],
                          textColor: Colors.black,
                          onPressed: () {
                            initialiseAccelerometerSensor();
                          },
                          child: Text("Initialise Accelerometer Sensor"))),
                  SizedBox(
                      width: 300,
                      child: MaterialButton(
                        height: 40.0,
                        minWidth: 70.0,
                        color: Colors.yellow[100],
                        textColor: Colors.black,
                        onPressed: () {
                          AndroidSensors.accelerometerReading.then((value) {
                            setState(() {
                              typeGameValue1 = value[0];
                              typeGameValue2 = value[1];
                              typeGameValue3 = value[2];
                            });
                          });
                        },
                        child: Text("Get Accelerometer Value"),
                      )),
                  SizedBox(
                      width: 300,
                      child: MaterialButton(
                          height: 40.0,
                          minWidth: 70.0,
                          color: Colors.blue[100],
                          textColor: Colors.black,
                          onPressed: () {
                            initialiseGyroscopeSensor();
                          },
                          child: Text("Initialise Gyroscope Sensor"))),
                  SizedBox(
                      width: 300,
                      child: MaterialButton(
                        height: 40.0,
                        minWidth: 70.0,
                        color: Colors.blue[100],
                        textColor: Colors.black,
                        onPressed: () {
                          AndroidSensors.gyroscopeReading.then((value) {
                            setState(() {
                              typeGameValue1 = value[0];
                              typeGameValue2 = value[1];
                              typeGameValue3 = value[2];
                            });
                          });
                        },
                        child: Text("Get Gyroscope Value"),
                      )),
                  // SizedBox(
                  //     width: 300,
                  //     child: MaterialButton(
                  //         height: 40.0,
                  //         minWidth: 70.0,
                  //         color: Colors.orange[100],
                  //         textColor: Colors.black,
                  //         onPressed: () {
                  //           initialiseLinearAccelerationSensor();
                  //         },
                  //         child:
                  //             Text("initialise Linear Acceleration Sensor"))),
                  // SizedBox(
                  //     width: 300,
                  //     child: MaterialButton(
                  //       height: 40.0,
                  //       minWidth: 70.0,
                  //       color: Colors.orange[100],
                  //       textColor: Colors.black,
                  //       onPressed: () {
                  //         AndroidSensors.linearAccelerationReading
                  //             .then((value) {
                  //           setState(() {
                  //             typeGameValue1 = value[0];
                  //             typeGameValue2 = value[1];
                  //             typeGameValue3 = value[2];
                  //           });
                  //         });
                  //       },
                  //       child: Text("Get Linear Acceleration Value"),
                  //     )),
                  // SizedBox(
                  //     width: 300,
                  //     child: MaterialButton(
                  //         height: 40.0,
                  //         minWidth: 70.0,
                  //         color: Colors.green[100],
                  //         textColor: Colors.black,
                  //         onPressed: () {
                  //           initialiseTypeRotationSensor();
                  //         },
                  //         child: Text("initialise Type Rotation Sensor"))),
                  // SizedBox(
                  //     width: 300,
                  //     child: MaterialButton(
                  //       height: 40.0,
                  //       minWidth: 70.0,
                  //       color: Colors.green[100],
                  //       textColor: Colors.black,
                  //       onPressed: () {
                  //         AndroidSensors.typeRotationReading.then((value) {
                  //           setState(() {
                  //             typeGameValue1 = value[0];
                  //             typeGameValue2 = value[1];
                  //             typeGameValue3 = value[2];
                  //           });
                  //         });
                  //       },
                  //       child: Text("Get Type Rotation Value"),
                  //     )),
                  // SizedBox(
                  //     width: 300,
                  //     child: MaterialButton(
                  //         height: 40.0,
                  //         minWidth: 70.0,
                  //         color: Colors.yellow[100],
                  //         textColor: Colors.black,
                  //         onPressed: () {
                  //           initialiseStepCounterSensor();
                  //         },
                  //         child: Text("initialise Step Counter Sensor"))),
                  // SizedBox(
                  //   width: 300,
                  //   child: MaterialButton(
                  //     height: 40.0,
                  //     minWidth: 70.0,
                  //     color: Colors.yellow[100],
                  //     textColor: Colors.black,
                  //     onPressed: () {
                  //       AndroidSensors.stepCounterReading.then((value) {
                  //         setState(() {
                  //           typeGameValue1 = value[0];
                  //         });
                  //       });
                  //     },
                  //     child: Text("Get Step Counter Value"),
                  //   ),
                  // ),
                  SizedBox(
                      width: 300,
                      child: MaterialButton(
                          height: 40.0,
                          minWidth: 70.0,
                          color: Colors.red[100],
                          textColor: Colors.black,
                          onPressed: () {
                            initialiseLightSensor();
                          },
                          child: Text("Initialise Light Sensor"))),
                  SizedBox(
                      width: 300,
                      child: MaterialButton(
                        height: 40.0,
                        minWidth: 70.0,
                        color: Colors.red[100],
                        textColor: Colors.black,
                        onPressed: () {
                          AndroidSensors.lightReading.then((value) {
                            setState(() {
                              typeGameValue1 = value[0];
                            });
                          });
                        },
                        child: Text("Get Light Value"),
                      )),
                ])),
          )),
    );
  }
}
