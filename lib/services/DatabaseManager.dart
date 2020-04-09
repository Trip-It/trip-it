import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trip_it_app/models/card.dart';
import 'package:trip_it_app/models/profile.dart';

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
      await db.execute("CREATE TABLE profiles(name TEXT, picture TEXT, car TEXT, minCharge INT, maxCharge INT, rest INT, cinema INT, sport INT, plug INT, language TEXT, mapType TEXT )");
      await db.execute("CREATE TABLE usercards(name TEXT, image TEXT, url TEXT )");
      await db.execute("CREATE TABLE allcards(name TEXT, image TEXT, url TEXT )");
      await db.execute("CREATE TABLE temporarycards(name TEXT, image TEXT, url TEXT )");

      // Use the following line to create new tables
      //await db.execute("CREATE TABLE TableName(attribute TYPE)");
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

  /// Methods related to profiles

  /// Get all profiles
  Future<List<Profile>> getProfiles() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM profiles');
    List<Profile> profiles = new List();
    for (int i = 0; i < list.length; i++) {
      profiles.add(new Profile(list[i]["name"], list[i]["picture"], list[i]["car"], list[i]["minCharge"], list[i]["maxCharge"], list[i]["rest"], list[i]["cinema"], list[i]["sport"], list[i]["plug"], list[i]["language"], list[i]["mapType"]));
    }
    return profiles;
  }

  /// Save profile
  void saveProfile(Profile profile) async {
    var dbClient = await database;

    // Check if profile is already existing
    Profile check = await this.getProfile(profile.getName());

    if(profile == null){
      //TODO show error message
      print("Not able to save profile since it already exists!");
      return;
    } else {
      print("Saving profile");
      await dbClient.transaction((txn) async {
        return await txn.rawInsert(
            'INSERT INTO profiles(name, picture, car, minCharge, maxCharge, rest, cinema, sport, plug, language, mapType) VALUES(' +
                '\'' +
                profile.getName() +
                '\'' +
                ',' +
                '\'' +
                profile.getPicture() +
                '\'' +
                ',' +
                '\'' +
                profile.getCar() +
                '\'' +
                ',' +
                '\'' +
                profile.getMinimumCharge().toString() +
                '\'' +
                ',' +
                '\'' +
                profile.getMaximumCharge().toString() +
                '\'' +
                ',' +
                '\'' +
                profile.getRestaurant().toString() +
                '\'' +
                ',' +
                '\'' +
                profile.getCinema().toString() +
                '\'' +
                ',' +
                '\'' +
                profile.getSport().toString() +
                '\'' +
                ',' +
                '\'' +
                profile.getPlug().toString() +
                '\'' +
                ',' +
                '\'' +
                profile.getLanguage() +
                '\'' +
                ',' +
                '\'' +
                profile.getMapType() +
                '\'' +
                ')');
      });
    }
  }

  /// Get one profile
  Future<Profile> getProfile(String name) async{
    var dbClient = await database;
    List<Map> profile = await dbClient.rawQuery('SELECT * FROM profiles WHERE name = ?', [name]);

    if(profile.isEmpty){
      return null;
    } else {
      return new Profile(profile.first["name"], profile.first["picture"], profile.first["car"], profile.first["minCharge"], profile.first["maxCharge"], profile.first["rest"], profile.first["cinema"], profile.first["sport"], profile.first["plug"], profile.first["language"], profile.first["mapType"]);
    }
  }

  /// Method to delete a given profile
  /// returns true if operation has been successful, false if not
  Future<bool> deleteProfile(Profile profile) async {
    var dbClient = await database;

    int res =
    await dbClient.rawDelete('DELETE FROM profiles WHERE name = ?', [profile.getName()]);
    return res > 0 ? true : false;
  }

  /// Method to update a given profile
  /// returns true if operation has been successful, false if not
  Future<bool> update(Profile profile) async {
    var dbClient = await database;
    int res =   await dbClient.update("profile", profile.toMap(),
        where: "name = ?", whereArgs: <String>[profile.getName()]);
    return res > 0 ? true : false;
  }


  /// Methods related to cards

  /// Get cards
  Future<List<ChargeCard>> getCards() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM usercards');
    List<ChargeCard> cards = new List();
    for (int i = 0; i < list.length; i++) {
      cards.add(new ChargeCard(list[i]["name"], list[i]["image"], list[i]["url"]));
    }
    return cards;
  }

  /// Save card
  void saveCard(ChargeCard card) async {
    var dbClient = await database;

    // Check if card is already existing
    final check = await this.getCard(card.name);

    if(check == null) {
      print("Saving card");
      await dbClient.transaction((txn) async {
        return await txn.rawInsert(
            'INSERT INTO usercards(name, image, url) VALUES(' +
                '\'' +
                card.name +
                '\'' +
                ',' +
                '\'' +
                card.image +
                '\'' +
                ',' +
                '\'' +
                card.url +
                '\'' +
                ')');
      });
    } else {
      //TODO show error message
      print("Not able to save card since it already exists!");
      return;
    }
  }

  /// Get one card
  Future<ChargeCard> getCard(String name) async{
    var dbClient = await database;
    List<Map> card = await dbClient.rawQuery('SELECT * FROM usercards WHERE name = ?', [name]);

    if(card.isEmpty){
      return null;
    } else {
      return new ChargeCard(card.first["name"], card.first["image"], card.first["url"]);
    }
  }

  /// Method to delete a given card
  /// returns true if operation has been successful, false if not
  Future<bool> deleteCard(ChargeCard card) async {
    var dbClient = await database;

    int res =
    await dbClient.rawDelete('DELETE FROM usercards WHERE name = ?', [card.name]);
    return res > 0 ? true : false;
  }




  /// Methods related to all cards
  /// Get all cards
  Future<List<ChargeCard>> getAllCards() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM allcards');
    List<ChargeCard> cards = new List();
    for (int i = 0; i < list.length; i++) {
      cards.add(new ChargeCard(list[i]["name"], list[i]["image"], list[i]["url"]));
    }
    return cards;
  }

  /// Get one card
  Future<ChargeCard> getOneCard(String name) async{
    var dbClient = await database;
    List<Map> card = await dbClient.rawQuery('SELECT * FROM allcards WHERE name = ?', [name]);

    if(card.isEmpty){
      return null;
    } else {
      return new ChargeCard(card.first["name"], card.first["image"], card.first["url"]);
    }
  }


  /// Methods related to temporary cards

  /// Get cards
  Future<List<ChargeCard>> getTemporaryCards() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM temporarycards');
    List<ChargeCard> cards = new List();
    for (int i = 0; i < list.length; i++) {
      cards.add(new ChargeCard(list[i]["name"], list[i]["image"], list[i]["url"]));
    }
    return cards;
  }

  /// Save card
  void saveTemporaryCard(ChargeCard card) async {
    var dbClient = await database;

    // Check if card is already existing
    final check = await this.getCard(card.name);

    if(check == null) {
      print("Saving card");
      await dbClient.transaction((txn) async {
        return await txn.rawInsert(
            'INSERT INTO temporarycards(name, image, url) VALUES(' +
                '\'' +
                card.name +
                '\'' +
                ',' +
                '\'' +
                card.image +
                '\'' +
                ',' +
                '\'' +
                card.url +
                '\'' +
                ')');
      });
    } else {
      //TODO show error message
      print("Not able to save card since it already exists!");
      return;
    }
  }

  /// Method to delete a given card
  /// returns true if operation has been successful, false if not
  Future<bool> deleteTemporaryCard(ChargeCard card) async {
    var dbClient = await database;

    int res =
    await dbClient.rawDelete('DELETE FROM temporarycards WHERE name = ?', [card.name]);
    return res > 0 ? true : false;
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
