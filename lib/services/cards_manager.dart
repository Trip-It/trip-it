import 'package:trip_it_app/services/database_manager.dart';
import 'package:trip_it_app/models/charging_station.dart';
import 'dart:async';
import 'package:trip_it_app/models/card.dart';

/// Class to handle database interactions for charging stations
class CardsManager extends DatabaseManager {

  CardsManager() :super();
/// MY CARDS
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

/// Methods related to Filtered YOUR CARDS

  /// Get cards
  Future<List<ChargeCard>> getFilteredYourCards() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM filteredyourcards');
    List<ChargeCard> cards = new List();
    for (int i = 0; i < list.length; i++) {
      cards.add(new ChargeCard(list[i]["name"], list[i]["image"], list[i]["url"]));
    }
    return cards;
  }

  /// Save card
  void saveFilteredYourCard(ChargeCard card) async {
    var dbClient = await database;

    // Check if card is already existing
    final check = await this.getCard(card.name);

    if(check == null) {
      print("Saving card");
      await dbClient.transaction((txn) async {
        return await txn.rawInsert(
            'INSERT INTO filteredyourcards(name, image, url) VALUES(' +
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
      print("Not able to save filtered card since it already exists!");
      return;
    }
  }

  /// Method to delete a given card
  /// returns true if operation has been successful, false if not
  Future<bool> deleteFilteredYourCard(ChargeCard card) async {
    var dbClient = await database;
    int res =
    await dbClient.rawDelete('DELETE FROM filteredyourcards WHERE name = ?', [card.name]);
    return res > 0 ? true : false;

  }
  Future<void> deleteAllFilteredYourCard()async{
    List<ChargeCard> cards = await getFilteredYourCards();
    bool res;
    int i;
    for (i = 0; i < cards.length; i++){
      res = await deleteFilteredYourCard(cards[i]);
      if (res == false){
        print("------------------Not able to clean the table--------------------");
      }
    }
    //int res =
    //await dbClient.rawDelete('DELETE * FROM filteredyourcards');
    /*if (res == 0)  {
       print("------------------Not able to clean the table--------------------");

      return false;
    }
    return true;*/
  }
}