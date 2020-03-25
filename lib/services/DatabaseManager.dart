import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'tripit_database.db'),
    // When the database is first created, create a table to store information.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE tripit(id INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  Future<void> insert(Tripit tripit) async {
    // Get a reference to the database.
    final Database db = await database;

  
    await db.insert(
      'tripit',
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

  Future<void> update(Tripit tripit) async {
    // Get a reference to the database.
    final db = await database;

    
    await db.update(
      'tripit',
      tripit.toMap(),
      
      where: "id = ?",
      // Pass the id as a whereArg to prevent SQL injection.
      whereArgs: [tripit.id],
    );
  }

  Future<void> delete(int id) async {
    // Get a reference to the database.
    final db = await database;

    
    await db.delete(
      'tripit',
      
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
  //await insert(example);

  // Print the list 
  //print(await tripit());

  
  //example = Tripit(
   // id: example.id,
  //);
  //await update(example);

  // Print updated information.
  //print(await tripit());

  // Delete example from the database.
  //await delete(example.id);

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
