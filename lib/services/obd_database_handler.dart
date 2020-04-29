import 'package:flutter_blue/flutter_blue.dart';
import 'package:trip_it_app/services/database_manager.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:typed_data';
import 'package:trip_it_app/services/connection_manager.dart';
import 'package:trip_it_app/screens/obd_data.dart';
import 'package:flutter/foundation.dart';

class ObdDatabaseHandler extends DatabaseManager {
  List<BluetoothService> realServices;
  List<ObdService> realObdServices;


  ///init ObdDatabaseHandler
  @override
  ObdDatabaseHandler() : super();

  @override
  initDB() async {
    // init the database tripitDB with one attribute id
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "tripitDB");
    return await openDatabase(path, version: 1, onOpen: (db) async {
      // Only copy if the database doesn't exist
      if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
        // Load database from asset and copy
        ByteData data = await rootBundle.load(join('data', 'trip_it_data.db'));
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

        // Save copied asset to documents
        await new File(path).writeAsBytes(bytes);
      }

      var db = await openDatabase(path);
    }, onCreate: (Database db, int version) async {
      await db.execute('''
create table TableService ( 
  ID integer primary key autoincrement, 
  UUID var, 
  service BluetoothService not null,
  Characteristics List<BluetoothCharacteristic> not null)
''');

//              "CREATE TABLE ObdServices(uuid VAR, service BLUETOOTHSERVICE, characteristics LIST<BLUETOOTHCHARACTERISTIC> )");
      // Use the following line to create new tables
      //await db.execute("CREATE TABLE TableName(attribute TYPE)");
    });
  }

  void toObdService(List<BluetoothService> services) {
    for (var i = 1; i <= services.length; i++) {
      realObdServices.elementAt(i).uuid = services.elementAt(i).uuid;
      realObdServices.elementAt(i).characteristics =
          services.elementAt(i).characteristics;
//      realObdServices.elementAt(i).service = services.elementAt(i);
    }
  }

  //query data from OBD DB

  //insert obdService into Database db for obdServices
  Future<void> insertObdService(ObdService obdService) async {
    final Database db = await database;
    await db.insert('obdServices', obdService.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///get obdService from Database db
  Future<List<ObdService>> getObdService() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The obdServices.
    final List<Map<String, dynamic>> maps = await db.query('obdService');

    // Convert the List<Map<String, dynamic> into a List<obdService>.
    return List.generate(maps.length, (i) {
      return ObdService(
        id : maps[i]['id'],
        uuid: maps[i]['uuid'],
//        service: maps[i]['service'],
        characteristics: maps[i]['characteristics'],
      );
    });
  }

  Future<void> updateObdService(ObdService obdService) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given ObdService.
    await db.update(
      'obdServices',
      obdService.toMap(),
      // Ensure that the Service has a matching id.
      where: "id = ?",
      // Pass the obdServices's id as a whereArg to prevent SQL injection.
      whereArgs: [obdService.id],
    );
  }

  Future<void> deleteObdService(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the obdService from the Database.
    await db.delete(
      'obdServices',
      // Use a `where` clause to delete a specific ObdService.
      where: "id = ?",
      // Pass the obdServices' id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}

//class for saving retrieved service including its UUID and characteristic
class ObdService {
  int id;
  var uuid;
//
  List<BluetoothCharacteristic> characteristics;
  final String tableService = "tableSerivce";
  final String columnID = "ID";
  final String columnUUID = "UUID";
  final String columnCharacteristic = "Characteristic";

  //each characteristic has multiple descriptors
  //  List<BluetoothDescriptor> descriptors;

  ObdService({this.id, this.uuid, this.characteristics});

  Map<String, dynamic> toMap() {
    return {
      'ID' : id,
      'UUID' : uuid,
//    'service' : service,
      'characteristics' : characteristics,
    };
  }

  fromMap(Map<String, dynamic> map) {
    id = map['ID'];
    uuid = map['UUID'];
//    service = map['service'];
    characteristics = map['characteristics'];
  }
}
