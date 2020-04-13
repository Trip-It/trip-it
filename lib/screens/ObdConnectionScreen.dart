import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:convert';
import 'package:trip_it_app/screens/obd_data.dart';



class ObdConnectionScreen extends StatefulWidget {
  static const routeName = '/ObdConnectionScreen';
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();
  final Map<Guid, List<int>> readValues = new Map<Guid, List<int>>();

  @override
  _ObdConnectionScreenState createState() => _ObdConnectionScreenState();
}

class _ObdConnectionScreenState extends State<ObdConnectionScreen> {
  BluetoothDevice _connectedDevice;
  List<BluetoothService> _services;
  final _writeController = TextEditingController();

  _addDeviceTolist(final BluetoothDevice device) {
    if (!widget.devicesList.contains(device)) {
      setState(() {
        widget.devicesList.add(device);
      });
    }
  }

  @override
    void initState() {
    super.initState();
    widget.flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        _addDeviceTolist(device);
      }
    });
    widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceTolist(result.device);
      }
    });
    widget.flutterBlue.startScan();
  }

  ListView _buildListViewOfDevices() {
    List<Container> containers = new List<Container>();
    for (BluetoothDevice device in widget.devicesList) {
      containers.add(
        Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(device.name == '' ? '(unknown device)' : device.name),
                    Text(device.id.toString()),
                  ],
                ),
              ),
              FlatButton(
                color: Colors.blue,
                child: Text(
                  'Connect',
                  style: TextStyle(color: Colors.white),
                ),
                  onPressed: () {
                    setState(() async {
                      widget.flutterBlue.stopScan();
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

                      Navigator.push(context, MaterialPageRoute(builder:(context)
                          => ObdDataScreen(connectedDevice:_connectedDevice, services:_services,
                      )),
                      );

                    });
                  },
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...containers,
      ],
    );
  }

  ListView _buildView() {

      return _buildListViewOfDevices();
    }



  @override
    Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Connect your OBD"),
    ),
    body: _buildView(),
  );
}
