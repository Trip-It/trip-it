import 'package:flutter_blue/flutter_blue.dart';
import 'package:trip_it_app/services/database_manager.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:typed_data';
import 'package:trip_it_app/models/obd_service.dart';
import 'package:trip_it_app/models/car_state.dart';
import 'package:trip_it_app/services/connection_manager.dart';
import 'package:trip_it_app/screens/obd_data.dart';
import 'package:flutter/foundation.dart';

class ObdDatabaseHandler extends DatabaseManager {

///init ObdDatabaseHandler

  ObdDatabaseHandler() : super();

  Future<List<CarState>> getCarState() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM carstates');
    List<CarState> carStates = new List();
    for (int i = 0; i < list.length; i++) {
      carStates.add(new CarState(list[i]["speed"], list[i]["soc"], list[i]["soh"]));
    }
    return carStates;
  }

  Future<List<ObdService>> getObdService() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM obdservices');
    List<ObdService> obdServices = new List();
    for (int i = 0; i < list.length; i++) {
      obdServices.add(new ObdService()); //list[i]["uuid"], list[i]["uuidchar"]
    }
    return obdServices;
  }

}


