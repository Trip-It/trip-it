import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:convert';
import 'package:trip_it_app/screens/obd_data.dart';
import 'package:trip_it_app/services/connection_manager.dart';
import 'package:trip_it_app/services/obd_database_handler.dart';
import 'dart:async';

/// OBD Connection screen for handling the interaction with connection_manager
/// showing all available Bluetooth devices and buttons for connecting and disconnecting to devices
/// Sends services to Data Screen and stores them in OBD Database

class ObdConnection extends StatefulWidget {
  static const routeName = '/ObdConnection';
  ConnectionManager connectionManager =
      new ConnectionManager(); //= new ConnectionManager();


  @override
  _ObdConnectionState createState() => _ObdConnectionState();
}

class _ObdConnectionState extends State<ObdConnection> {
  BluetoothDevice _connectedDevice;
  List<BluetoothService> _services;
  final _writeController = TextEditingController();
  static const savingInterval = const Duration(minutes:10);
  Timer timerSaving;
  ObdDatabaseHandler obdDatabaseHandler;

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.connectionManager.connectionManager();
      widget.connectionManager.fillDeviceList();
    });
  }

  _buildListViewOfDevices() {
    List<Container> containers = new List<Container>();
    if (widget.connectionManager.devicesList.isEmpty) {
      containers.add(Container(
        height: 50,
        alignment: Alignment.center,
        color: Colors.redAccent,
        child: Text('No devices found, please search again'),
      ));
    }
    if (widget.connectionManager.devicesList.isNotEmpty) {
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
                      //writing data into OBD DB!
                      //Place code here
                      //Async >> Timer
                      if (_connectedDevice != null){
//                        Timer.periodic(savingInterval, giveDataToDecry(timerSaving));
                        Timer.periodic(savingInterval, (timerSaving) {} );  //give data to decoding or to DB (ObdDatabaseHandler._database.insertObdDB);
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ObdDataScreen(
                                  connectedDevice: _connectedDevice,
                                  services: _services,
                                )),
                      );
                    });
                  },
                ),
                FlatButton(
                    color: Colors.blueGrey,
                    child: Text(
                      'Disconnect',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() async {
                        widget.connectionManager.flutterBlue.stopScan();
                        try {
                          await device.disconnect();
                        } catch (e) {
                          if (e.code != 'already_disconnected') {
                            throw e;
                          }
                        }
                        if (_connectedDevice != null){
                          timerSaving.cancel;
                        _connectedDevice = null;
                        }
                        //CANCELING TIMER FOR SAVING DATA
                      });
                    })
              ],
            ),
          ),
        );
      }
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
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.bluetooth),
          onPressed: () {
            setState(() {
              widget.connectionManager.fillDeviceList();
            });
          }));


//  void giveDataToDecry(Timer t)

}
