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
  final ObdDatabaseHandler databaseHandler = ObdDatabaseHandler();
  final BluetoothDevice connectedDevice;
  final List<BluetoothService> services;

  ObdOptionScreen({this.connectedDevice, this.services});

  @override
  _ObdOptionScreenState createState() => _ObdOptionScreenState();
}

class _ObdOptionScreenState extends State<ObdOptionScreen> {
  static const savingInterval = Duration(minutes: 10);
  Timer timerSaving;

  CarState carStateFromObd; //needs to be given from DataInterpreter

  ListView _buildOptionsView() {
    List<Container> containers = new List<Container>();
    containers.add(Container(
      height: 50,
      color: Colors.blueGrey,
      child: FlatButton(
        onPressed: () {
          widget.databaseHandler.startRecording(timerSaving, savingInterval,
              carStateFromObd); //Starts recording of data from OBD
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ObdDataScreen(
                      connectedDevice: widget.connectedDevice,
                      services: widget.services,
                    )),
          );
        },
        child: Text('Start recording'),
      ),
      alignment: Alignment(0, -0.75),
    ));
    containers.add(Container(
      height: 50,
      color: Colors.blueGrey,
      child: FlatButton(
        onPressed: () {
          widget.databaseHandler
              .stopRecording(timerSaving); //Stops recording of data from OBD
        },
        child: Text('Stop recording'),
      ),
      alignment: Alignment(0, -0.25),
    ));
    containers.add(Container(
      height: 40,
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
      height: 50,
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
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        containers[0],
        containers[1],
        containers[2],
        containers[3],
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Options"),
          centerTitle: true,
        ),
        body: _buildOptionsView(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, ObdConnectionScreen.routeName);
          },
        ));
  }
}
