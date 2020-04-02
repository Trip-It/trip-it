import 'package:flutter/material.dart';
import 'package:trip_it_app/models/card.dart';
import 'package:trip_it_app/services/DatabaseManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:trip_it_app/theme.dart';


class AddCardScreen extends StatelessWidget {
  static const routeName = '/addCard';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Add Card"),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
          new RaisedButton(
            color: TripItColors.primaryLightBlue,
           child: new Text(
            "That's how you add a card",
            style: TextStyle(color: TripItColors.primaryDarkBlue),
          ),
          onPressed: () {
            saveInCurrentCard();
          },//onPressed
        )
       ],
    ),
    );

  }

  /// Method to save a card
  void saveInCurrentCard() async{
    DatabaseManager dbManager = DatabaseManager.db;

    ChargeCard toSave = new ChargeCard("freshmile", "assets/freshmile.png", "https://www.freshmile.com");

    dbManager.saveCard(toSave);


    List<ChargeCard> mycards = await dbManager.getCards();
    print(mycards.first.toString());

    return;
  }
}