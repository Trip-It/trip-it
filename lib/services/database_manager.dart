import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._();
  static final DatabaseManager db = DatabaseManager._();
  Database _database;

  DatabaseManager();

  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null, instantiate it
    _database = await initDB();

    // create tables that will be used in the application but are not included in the asset database
    await createTables( _database );

    return _database;
  }

  initDB() async{
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "tripit.db");

    ByteData data = await rootBundle.load("data/trip_it_data.db");
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);
    return await openDatabase(dbPath);
  }

  createTables(Database db) async{

    await db.execute("CREATE TABLE profiles(name TEXT, picture TEXT, car TEXT, minCharge INT, maxCharge INT, rest INT, cinema INT, sport INT, plug INT, language TEXT, mapType TEXT )");
    await db.execute("CREATE TABLE usercards(name TEXT, image TEXT, url TEXT )");
    await db.execute("CREATE TABLE temporarycards(name TEXT, image TEXT, url TEXT )");

    // Use the following line to create new tables
    //await db.execute("CREATE TABLE TableName(attribute TYPE)");
  }

  Future<void> insertDB(Tripit tripit) async {
    // insert more information
    // Get a reference to the database.
    final Database db = await database;

    await db.insert(
      'tripitDB',
      tripit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Tripit>> tripit() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all the information. Query=request for information
    final List<Map<String, dynamic>> maps = await db.query('tripit');

    // Convert the List<Map<String, dynamic> into a List<>.
    return List.generate(maps.length, (i) {
      return Tripit(
        id: maps[i]['id'],
      );
    });
  }

  Future<void> updateDB(Tripit tripit) async {
    // Get a reference to the database.
    final db = await database;

    await db.update(
      'tripitDB',
      tripit.toMap(),

      where: "id = ?",
      // Pass the id as a whereArg to prevent SQL injection.
      whereArgs: [tripit.id],
    );
  }

  Future<void> deleteDB(int id) async {
    // Get a reference to the database.
    final db = await database;

    await db.delete(
      'tripitDB',

      where: "id = ?",
      // Pass the id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }



// It's just an example of implementing.
  //var example = Tripit(
  //id: 0,

  // );

  // Insert into the database.
  //await insertDB(example);

  // Print the list
  //print(await tripit());

  //example = Tripit(
  // id: example.id,
  //);
  //await update(example);

  // Print updated information.
  //print(await tripit());

  // Delete example from the database.
  //await deleteDB(example.id);

  // Print the list
  //print(await tripit());
}

//For example, I create a class tripit with one attribut "id".
class Tripit {
  final int id;
  Tripit({this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }
}
