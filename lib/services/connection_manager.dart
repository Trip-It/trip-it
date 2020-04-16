import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ConnectionManager {
  FlutterBlue flutterBlue;
  List<BluetoothDevice> devicesList;
  Map<Guid, List<int>> readValues;
  BluetoothDevice _connectedDevice;
  List<BluetoothService> _services;

  connectionManager() {
    this.flutterBlue = FlutterBlue.instance;
    this.devicesList = new List<BluetoothDevice>();
    this.readValues = new Map<Guid, List<int>>();
    this._services = new List<BluetoothService>();
  }

  void fillDeviceList(){
    flutterBlue.startScan();
    flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        addDeviceToList(device);
      }
    });
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        addDeviceToList(result.device);
      }
    });
  }

  void addDeviceToList(final BluetoothDevice device) {
    if (!devicesList.contains(device)) {
      devicesList.add(device);
    }
    ;
  }

  void startScanDev() {
    flutterBlue.startScan();
  }

  void stopScanDev() {
    flutterBlue.stopScan();
  }

  void discoverServicesDev(BluetoothDevice device) async {
    try {
      await device.connect();
    } catch (e) {
      if (e.code != 'already_connected') {
        throw e;
      }
    } finally {
      _services = await device.discoverServices();
    }
    _connectedDevice = device;
  }
}
