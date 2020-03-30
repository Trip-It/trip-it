import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._();
  static final DatabaseManager db = DatabaseManager._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {// init the database tripitDB whith one attribut id
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "tripitDB");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Tripit ("
          "id INTEGER PRIMARY KEY,"
          ")");
    });
  }

  Future<void> insertDB(Tripit tripit) async {// insert more information
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