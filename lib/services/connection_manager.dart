import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ConnectionManager {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> devicesList = new List<BluetoothDevice>();
  Map<Guid, List<int>> readValues = new Map<Guid, List<int>>();
  BluetoothDevice _connectedDevice;
  List<BluetoothService> _services = new List<BluetoothService>();

  connectionManager() {
   this.flutterBlue = FlutterBlue.instance;
   this.devicesList = new List<BluetoothDevice>();
   this.readValues = new Map<Guid, List<int>>();
   this._services = new List<BluetoothService>();
  }

  void fillDeviceList() { //async?
    flutterBlue.stopScan();
    flutterBlue.startScan();
    flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        addDeviceToList(device);
      }
    });
    flutterBlue.scanResults.listen ((List<ScanResult> results) {
      for (ScanResult result in results) {
        addDeviceToList(result.device);
      }
    });
//    flutterBlue.stopScan();
//    flutterBlue.startScan();
  }

  void addDeviceToList(final BluetoothDevice device) {
    if (!devicesList.contains(device)) {
      devicesList.add(device);
    }
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
