import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:trip_it_app/models/car.dart';
import 'package:trip_it_app/models/obd_service.dart';
import 'package:trip_it_app/models/car_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:trip_it_app/screens/obd_connection.dart';
import 'package:trip_it_app/services/obd_database_handler.dart';
import 'dart:async';
import 'package:trip_it_app/screens/obd_data.dart';

class ObdOptionScreen extends StatefulWidget {
  static const routeName = '/obd_option';

//  List<CarState> carStates;
//  List<ObdService> obdServices;
  ObdDatabaseHandler databaseHandler;
  final BluetoothDevice connectedDevice;
  final List<BluetoothService> services;

  ObdOptionScreen({this.connectedDevice, this.services}) {
    this.databaseHandler = ObdDatabaseHandler();
  }

  @override
  _ObdOptionScreenState createState() => _ObdOptionScreenState();
}

class _ObdOptionScreenState extends State<ObdOptionScreen> {
  bool recPressed = false;

  ListView _buildOptionsView() {
    List<Container> containers = new List<Container>();
    containers.add(Container(
      height: 40,
      margin: EdgeInsets.all(2),
      color: Colors.blueGrey,
      child: FlatButton(
        onPressed: () {
          _toggleButton();
          recPressed ? startRec() : stopRec();
        },
        child: recPressed ? Text('Stop recording') : Text('Start recording'),
      ),
      alignment: Alignment(0, -0.75),
    ));
    containers.add(Container(
      height: 40,
      margin: EdgeInsets.all(2),
      color: Colors.blueGrey,
      child: FlatButton(
        onPressed: () {
          widget.databaseHandler
              .emptyCarStates(); //Emptys the Database table for car states
//          widget.databaseHandler.emptyObdServices();
        },
        child: Text('Empty Database'),
      ),
      alignment: Alignment(0, 0.25),
    ));
    containers.add(Container(
      height: 40,
      margin: EdgeInsets.all(2),
      color: Colors.blueGrey,
      child: FlatButton(
        onPressed: () {
          widget.databaseHandler.exportToCSV(); //Exports car states to CSV file
        },
        child: Text('Export to CSV'),
      ),
      alignment: Alignment(0, 0.75),
    ));

    return ListView(
      padding: const EdgeInsets.all(2),
      children: <Widget>[
        containers[0],
        containers[1],
        containers[2],
      ],
    );
  }

  void _toggleButton() {
    setState(() {
      if (recPressed == false)
        recPressed = true;
      else
        recPressed = false;
    });
  }

  void startRec() {
    widget.databaseHandler.startRecording(); //Starts recording of data from OBD
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//          builder: (context) => ObdDataScreen(
//            connectedDevice: widget.connectedDevice,
//            services: widget.services,
//          )),
//    );
  }

  void stopRec() {
    widget.databaseHandler.stopRecording(); //Stops recording of data from OBD
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Options"),
        centerTitle: true,
      ),
      body: Center(child: _buildOptionsView()),
    );
  }
}
