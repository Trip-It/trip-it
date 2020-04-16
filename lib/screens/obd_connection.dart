import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:convert';
import 'package:trip_it_app/screens/obd_data.dart';
import 'package:trip_it_app/services/connection_manager.dart';

class ObdConnection extends StatefulWidget {
  static const routeName = '/ObdConnectionScreen';
  final ConnectionManager connectionManager = new ConnectionManager();
  @override
  _ObdConnectionState createState() => _ObdConnectionState();
}

class _ObdConnectionState extends State<ObdConnection> {
  BluetoothDevice _connectedDevice;
  List<BluetoothService> _services;
  final _writeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.connectionManager.fillDeviceList();
  }

  _buildListViewOfDevices() {
    List<Container> containers = new List<Container>();
  //  if(_connectionManager.devicesList != null) {
      for (BluetoothDevice device in widget.connectionManager.devicesList) {
        containers.add(
          Container(
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                          device.name == '' ? '(unknown device)' : device.name),
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
                      widget.connectionManager.flutterBlue.stopScan();
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

                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>
                          ObdDataScreen(connectedDevice: _connectedDevice,
                            services: _services,
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
  //}

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