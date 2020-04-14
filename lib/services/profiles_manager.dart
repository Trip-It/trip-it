import 'package:trip_it_app/services/database_manager.dart';
import 'package:trip_it_app/models/profile.dart';
import 'dart:async';

/// Class to handle database interactions for charging stations
class ProfilesManager extends DatabaseManager {

  ProfilesManager() :super();

  /// Get all profiles
  Future<List<Profile>> getProfiles() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM profiles');
    List<Profile> profiles = new List();
    for (int i = 0; i < list.length; i++) {
      profiles.add(new Profile(
          list[i]["name"],
          list[i]["picture"],
          list[i]["car"],
          list[i]["minCharge"],
          list[i]["maxCharge"],
          list[i]["rest"],
          list[i]["cinema"],
          list[i]["sport"],
          list[i]["plug"],
          list[i]["language"],
          list[i]["mapType"]));
    }
    return profiles;
  }

  /// Save profile
  void saveProfile(Profile profile) async {
    var dbClient = await database;

    // Check if profile is already existing
    Profile check = await this.getProfile(profile.getName());

    if (check != null) {
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
  Future<Profile> getProfile(String name) async {
    var dbClient = await database;
    List<Map> profile = await dbClient
        .rawQuery('SELECT * FROM profiles WHERE name = ?', [name]);

    if (profile.isEmpty) {
      return null;
    } else {
      return new Profile(
          profile.first["name"],
          profile.first["picture"],
          profile.first["car"],
          profile.first["minCharge"],
          profile.first["maxCharge"],
          profile.first["rest"],
          profile.first["cinema"],
          profile.first["sport"],
          profile.first["plug"],
          profile.first["language"],
          profile.first["mapType"]);
    }
  }

  /// Method to delete a given profile
  /// returns true if operation has been successful, false if not
  Future<bool> deleteProfile(Profile profile) async {
    var dbClient = await database;

    int res = await dbClient
        .rawDelete('DELETE FROM profiles WHERE name = ?', [profile.getName()]);
    return res > 0 ? true : false;
  }

  /// Method to update a given profile
  /// returns true if operation has been successful, false if not
  Future<bool> update(Profile profile) async {
    var dbClient = await database;
    int res = await dbClient.update("profile", profile.toMap(),
        where: "name = ?", whereArgs: <String>[profile.getName()]);
    return res > 0 ? true : false;
  }

}