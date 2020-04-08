import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothHandler{

  FlutterBlue flutterBlue = FlutterBlue.instance;

  void scan() {

    var results = flutterBlue.scan(timeout: Duration(seconds: 4));

    var subscription = flutterBlue.scanResults.listen((results){
      for (ScanResult r in results){
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });

    flutterBlue.stopScan();
  }
}

