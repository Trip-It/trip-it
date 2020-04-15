import 'package:trip_it_app/services/database_manager.dart';
import 'package:trip_it_app/models/charging_station.dart';
import 'dart:async';

/// Class to handle database interactions for charging stations
class ChargingManager extends DatabaseManager {

  ChargingManager():super();

  /// Get all stations
  Future<List<ChargingStation>> getChargingStations() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM profiles');
    List<ChargingStation> stations = new List();
    for (int i = 0; i < list.length; i++) {
      stations.add(new ChargingStation(
          list[i]["longitude"],
          list[i]["latitude"],
          list[i]["amenageur"],
          list[i]["operateur"],
          list[i]["enseigne"],
          list[i]["addresse"],
          list[i]["nbre_pdc"],
          list[i]["id_station"],
          list[i]["puiss_max"],
          list[i]["type_prise"],
          list[i]["access_recharge"],
          list[i]["accessibilite"]));
    }
    return stations;
  }

  /// Get one station
  Future<ChargingStation> getChargingStation(String id) async {
    var dbClient = await database;
    List<Map> station = await dbClient
        .rawQuery('SELECT * FROM profiles WHERE name = id_station', [id]);

    if (station.isEmpty) {
      return null;
    } else {
      return new ChargingStation(
          station.first["longitude"],
          station.first["latitude"],
          station.first["amenageur"],
          station.first["operateur"],
          station.first["enseigne"],
          station.first["addresse"],
          station.first["nbre_pdc"],
          station.first["id_station"],
          station.first["puiss_max"],
          station.first["type_prise"],
          station.first["access_recharge"],
          station.first["accessibilite"]);
    }
  }

}