package com.example.testandroidsensor2;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.*;
import io.flutter.plugin.common.*;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import io.flutter.plugin.common.BinaryMessenger;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.util.Log;
import java.lang.Object;
import java.util.ArrayList;

import static android.content.Context.BATTERY_SERVICE;


/** Testandroidsensor2Plugin */
public class Testandroidsensor2Plugin implements FlutterPlugin, MethodCallHandler,SensorEventListener,EventChannel.StreamHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private EventChannel eventChannel;
  private Activity activity;
  private Context mContext;
  private SensorManager sensorManager;
  private static final String CHANNEL = "samples.flutter.dev/battery";
  private static final String TYPEGAME_CHANNEL_NAME = "androidSensors/TypeGame";
  float batteryLevel = -1;
  private final float[] mRotationVectorReading = new float[3];
  private final float[] mRotationMatrix = new float[9];
  private final float[] mOrientationAngles = new float[3];
  private float[] mOrientation = new float[3];
  float mInitX, mX;
  private static final String TAG = "Testandroidsensor2Plugin";
  private EventChannel typegameChannel;
  private EventChannel.EventSink mEventSink;
  float gravityValue1,gravityValue2,gravityValue3;
  float accelerometerValue1,accelerometerValue2,accelerometerValue3;
  float gyroscopeValue1,gyroscopeValue2, gyroscopeValue3;
  float linearAccelerationValue1,linearAccelerationValue2,linearAccelerationValue3;
  float typeRotationValue1,typeRotationValue2,typeRotationValue3;
  float stepCounterValue1;
/*  private Testandroidsensor2Plugin(Activity activity, MethodChannel channel){
    this.activity = activity;
    this.channel = channel;
    this.channel.setMethodCallHandler(this);
  }*/

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    onAttachedToEngine(flutterPluginBinding.getApplicationContext(),flutterPluginBinding.getBinaryMessenger());
    channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "testandroidsensor2");
    channel.setMethodCallHandler(this);
    eventChannel = new EventChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "sensorData");
    eventChannel.setStreamHandler(this);
  }

  private void onAttachedToEngine(Context applicationContext, BinaryMessenger messenger) {
    this.mContext = applicationContext;
    channel = new MethodChannel(messenger, "testandroidsensor2");
    channel.setMethodCallHandler(this);
  }
  public static void registerWith(Registrar registrar) {
    Testandroidsensor2Plugin plugin = new Testandroidsensor2Plugin();
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "testandroidsensor2");
    channel.setMethodCallHandler(plugin);
    final EventChannel eventChannel = new EventChannel(registrar.messenger(), "sensorData");
    eventChannel.setStreamHandler(plugin);
  }

public Sensor InitialiseTypeGameSensor(){
  sensorManager = (SensorManager) mContext.getSystemService(mContext.SENSOR_SERVICE);
  Sensor rotationVector = sensorManager.getDefaultSensor(Sensor.TYPE_GAME_ROTATION_VECTOR);
  sensorManager.registerListener(Testandroidsensor2Plugin.this,rotationVector,SensorManager.SENSOR_DELAY_NORMAL);
  return rotationVector;
}

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    final Sensor rotationvector;
    if(call.method.equals("initialiseTypeGameSensor")){
       Log.i(TAG,"i am in initialisation");
    sensorManager = (SensorManager) mContext.getSystemService(mContext.SENSOR_SERVICE);
    Sensor rotationVector = sensorManager.getDefaultSensor(Sensor.TYPE_GAME_ROTATION_VECTOR);
    sensorManager.registerListener(Testandroidsensor2Plugin.this,rotationVector,SensorManager.SENSOR_DELAY_NORMAL);
    
  }
    if (call.method.equals("getTypeGameValue")) {
      Log.i(TAG,"i am in method");
        Log.i(TAG,"i am in gyroscope");
        sensorManager.getOrientation(mRotationMatrix, mOrientationAngles);
        if (batteryLevel != -1) {
          ArrayList<Float> args = new ArrayList<>();
          args.add(mOrientationAngles[0]);
          args.add(mOrientationAngles[1]);
          args.add(mOrientationAngles[2]);
          result.success(args);
        } else {
          result.error("UNAVAILABLE", "Battery level not available.", null);
        }
      //}
    } 
  if(call.method.equals("initialiseGravitySensor")){
     sensorManager = (SensorManager) mContext.getSystemService(mContext.SENSOR_SERVICE);
     Sensor rotationVector = sensorManager.getDefaultSensor(Sensor.TYPE_GRAVITY);
    sensorManager.registerListener(Testandroidsensor2Plugin.this,rotationVector,SensorManager.SENSOR_DELAY_NORMAL);
   }
  if(call.method.equals("getGravityValue")){
    ArrayList<Float> args = new ArrayList<>();
     args.add(gravityValue1);
     args.add(gravityValue2);
     args.add(gravityValue3);
     result.success(args);
   }
  if(call.method.equals("initialiseAccelerometerSensor")){
    sensorManager = (SensorManager) mContext.getSystemService(mContext.SENSOR_SERVICE);
    Sensor rotationVector = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
   sensorManager.registerListener(Testandroidsensor2Plugin.this,rotationVector,SensorManager.SENSOR_DELAY_NORMAL);
  }
  if(call.method.equals("getAccelerometerValue")){
    ArrayList<Float> args = new ArrayList<>();
     args.add(accelerometerValue1);
     args.add(accelerometerValue2);
     args.add(accelerometerValue3);
     result.success(args);
   }
  if(call.method.equals("initialiseGyroscopeSensor")){
    sensorManager = (SensorManager) mContext.getSystemService(mContext.SENSOR_SERVICE);
    Sensor rotationVector = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
   sensorManager.registerListener(Testandroidsensor2Plugin.this,rotationVector,SensorManager.SENSOR_DELAY_NORMAL);
  }
  if(call.method.equals("getGyroscopeValue")){
    ArrayList<Float> args = new ArrayList<>();
     args.add(gyroscopeValue1);
     args.add(gyroscopeValue2);
     args.add(gyroscopeValue3);
     result.success(args);
   }
   if(call.method.equals("initialiseLinearAccelerationSensor")){
    sensorManager = (SensorManager) mContext.getSystemService(mContext.SENSOR_SERVICE);
    Sensor rotationVector = sensorManager.getDefaultSensor(Sensor.TYPE_LINEAR_ACCELERATION);
   sensorManager.registerListener(Testandroidsensor2Plugin.this,rotationVector,SensorManager.SENSOR_DELAY_NORMAL);
  }
  if(call.method.equals("getLinearAccelerationValue")){
    ArrayList<Float> args = new ArrayList<>();
     args.add(linearAccelerationValue1);
     args.add(linearAccelerationValue2);
     args.add(linearAccelerationValue3);
     result.success(args);
   }
   if(call.method.equals("initialiseTypeRotationSensor")){
    sensorManager = (SensorManager) mContext.getSystemService(mContext.SENSOR_SERVICE);
    Sensor rotationVector = sensorManager.getDefaultSensor(Sensor.TYPE_ROTATION_VECTOR);
   sensorManager.registerListener(Testandroidsensor2Plugin.this,rotationVector,SensorManager.SENSOR_DELAY_NORMAL);
  }
  if(call.method.equals("getTypeRotationValue")){
    ArrayList<Float> args = new ArrayList<>();
     args.add(typeRotationValue1);
     args.add(typeRotationValue2);
     args.add(typeRotationValue3);
     result.success(args);
   }
  if(call.method.equals("initialiseStepCounterSensor")){
    sensorManager = (SensorManager) mContext.getSystemService(mContext.SENSOR_SERVICE);
    Sensor rotationVector = sensorManager.getDefaultSensor(Sensor.TYPE_STEP_COUNTER);
   sensorManager.registerListener(Testandroidsensor2Plugin.this,rotationVector,SensorManager.SENSOR_DELAY_NORMAL);
  }
  if(call.method.equals("getStepCounterValue")){
    ArrayList<Float> args = new ArrayList<>();
     args.add(stepCounterValue1);
     result.success(args);
   }
  else {
      result.notImplemented();
    }
  }
  @Override
  public void onAccuracyChanged(Sensor sensor, int i) {

  }

  @Override
  public void onSensorChanged(SensorEvent sensorEvent) {
    if (sensorEvent.sensor.getType() == Sensor.TYPE_GAME_ROTATION_VECTOR) {
      System.arraycopy(sensorEvent.values, 0, mRotationVectorReading,
              0, mRotationVectorReading.length);
    
    SensorManager.getRotationMatrixFromVector(mRotationMatrix, mRotationVectorReading);
    SensorManager.getOrientation(mRotationMatrix, mOrientationAngles);
    mInitX = (float) (mOrientationAngles[0]*180.0F/Math.PI);
    batteryLevel = mInitX;
    if(mEventSink!=null){
    mEventSink.success(mInitX);
    }
    }
    if(sensorEvent.sensor.getType() == Sensor.TYPE_GRAVITY){
      gravityValue1 = sensorEvent.values[0];
      gravityValue2 = sensorEvent.values[1];
      gravityValue3 = sensorEvent.values[2];
    }
    if(sensorEvent.sensor.getType() == Sensor.TYPE_ACCELEROMETER){
      accelerometerValue1 = sensorEvent.values[0];
      accelerometerValue2 = sensorEvent.values[1];
      accelerometerValue3 = sensorEvent.values[2];
    }
    if(sensorEvent.sensor.getType() == Sensor.TYPE_GYROSCOPE){
      gyroscopeValue1 = sensorEvent.values[0];
      gyroscopeValue2 = sensorEvent.values[1];
      gyroscopeValue3 = sensorEvent.values[2];
    }
    if(sensorEvent.sensor.getType() == Sensor.TYPE_LINEAR_ACCELERATION){
      linearAccelerationValue1 = sensorEvent.values[0];
      linearAccelerationValue2 = sensorEvent.values[1];
      linearAccelerationValue3 = sensorEvent.values[2];
    }
    if(sensorEvent.sensor.getType() == Sensor.TYPE_ROTATION_VECTOR){
      typeRotationValue1 = sensorEvent.values[0];
      typeRotationValue2 = sensorEvent.values[1];
      typeRotationValue3 = sensorEvent.values[2];
    }
    if(sensorEvent.sensor.getType() == Sensor.TYPE_STEP_COUNTER){
      stepCounterValue1 = sensorEvent.values[0];
      
    }
  }
  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onCancel(Object arguments){

  }

  @Override
  public void onListen(Object o, EventChannel.EventSink eventSink){
    mEventSink = eventSink;

  }

}
