import 'package:trip_it_app/services/database_manager.dart';
import 'package:trip_it_app/models/obd_service.dart';
import 'package:trip_it_app/models/car_state.dart';
import 'dart:async';
import 'package:csv/csv.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:trip_it_app/models/car_state.dart';
import 'package:trip_it_app/models/obd_service.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:typed_data';


class ObdDatabaseHandler extends DatabaseManager {
  ///init ObdDatabaseHandler
  Timer timerSaving;
  Duration savingInterval;
  CarState carState;

  ObdDatabaseHandler(){
    savingInterval = Duration(seconds: 5); //Set saving interval
    carState = CarState(1,0,100,100); //init car state
  }
  
//  ObdDatabaseHandler() : super()

  //save CarState in class in order to safe in Database
  void newCarState(CarState carStateFromObd){
    carState = carStateFromObd;
  }
  
  //get all CarStates in Database
  Future<List<CarState>> getCarState() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM carstates');
    List<CarState> carStates = new List();
    for (int i = 0; i < list.length; i++) {
      carStates.add(new CarState(
          list[i]["id"], list[i]["speed"], list[i]["soc"], list[i]["soh"]));
    }
    return carStates;
  }

  //get all ObdServices in Database
  Future<List<ObdService>> getObdService() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM obdservices');
    List<ObdService> obdServices = new List();
    for (int i = 0; i < list.length; i++) {
      obdServices.add(new ObdService()); //list[i]["uuid"], list[i]["uuidchar"]
    }
    return obdServices;
  }

  //get CarState of id X
  Future<CarState> getSingleCarState(int id) async {
    var dbClient = await database;
    List<Map> carState =
    await dbClient.rawQuery('SELECT * FROM carstates WHERE id = ?', [id]);

    if (carState.isEmpty) {
      return null;
    } else {
      return new CarState(carState.first["id"], carState.first["speed"],
          carState.first["soc"], carState.first["soh"]);
    }
  }

  void saveCarState(CarState carState) async {
    var dbClient = await database;

    // Check if carState is already existing
    final check = await this.getSingleCarState(carState.id);

    if (check == null) {
      await dbClient.transaction((txn) async {
        return await txn.rawInsert(
            'INSERT INTO carstates(id, speed, soc, soh) VALUES(' +
                '\'' +
                carState.id.toString() +
                '\'' +
                ',' +
                '\'' +
                carState.speed.toString() +
                '\'' +
                ',' +
                '\'' +
                carState.soc.toString() +
                '\'' +
                ',' +
                '\'' +
                carState.soh.toString() +
                '\'' +
                ')');
      });
    }
    return;
  }

  //delete one carstate with id X
  Future<bool> deleteCarState(CarState carState) async {
    var dbClient = await database;

    int res = await dbClient
        .rawDelete('DELETE FROM carstates WHERE id = ?', [carState.id]);
    return res > 0 ? true : false;
  }

  //empty table carstates
  Future<void> emptyCarStates() async {
    var dbClient = await database;
    dbClient.execute('DELETE FROM carstates');
    dbClient.execute('VACUUM');
  }

  Future<void> startRecording() async {
    Timer timer = new Timer.periodic(savingInterval, (time) {
      this.saveCarState(carState);
      timerSaving = time;
    });
  }

  Future<void> stopRecording() async {
    timerSaving.cancel();
  }

  Future<void> exportToCSV() async {
    Future<List<CarState>> list = getCarState();
    List<CarState> carStateList = new List();
    carStateList = await list;

    List<List<dynamic>> rows = List<List<dynamic>>();
    for (int i = 0; i < carStateList.length; i++) {
//row refer to each column of a row in csv file and rows refer to each row in a file
      List<dynamic> row = List();
      row.add(carStateList[i].id);
      row.add(carStateList[i].speed);
      row.add(carStateList[i].soc);
      row.add(carStateList[i].soh);
      rows.add(row);
    }

//store file in documents folder
    String dir = (await getExternalStorageDirectory()).absolute.path +
        "/documents";
    String file = "$dir";
    File f = new File(file + "obddata.csv");

// convert rows to String and write as csv file
    String csv = const ListToCsvConverter().convert(rows);
    f.writeAsString(csv);
  }


  /// Missing implementation of DatabaseHandler for ObdService
  /// Difficult because of List of Characteristics and Datatype: GUID

// In order to add all characteristics the columns need to be enhanced according to the amount of characteristics per service
// Column1: Service UUID, Column 2: Characteristic[1], Column 3: ..., Column N: Characteristic[N-1]
  addColumnsToTable() async {
    var dbClient = await database;
  }

}

