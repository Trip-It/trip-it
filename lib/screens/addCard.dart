import 'package:flutter/material.dart';
import 'package:trip_it_app/models/card.dart';
import 'package:trip_it_app/services/DatabaseManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/cardsListView.dart';
import 'package:trip_it_app/widgets/searchBarList.dart';

class AddCardScreen extends StatelessWidget {
  static const routeName = '/addCard';
  List<ChargeCard> allCards;
  List<ChargeCard> cardsToBeSaved;


  @override
  Widget build(BuildContext context) {
    initScreen();
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Card"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {
            saveInCurrentCard();
      },
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Container(
           margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            child: SearchBarCards(allCards),
          ),

          Container(
           margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            height: 240,
            child: CardsList(allCards, false),
          ),
          ],
          ),
          );

  }
  void initScreen()async{
    DatabaseManager dbManager = DatabaseManager.db;
    allCards = await dbManager.getAllCards();
  }

  /// Method to save a card
  void saveInCurrentCard() async{
    DatabaseManager dbManager = DatabaseManager.db;
    cardsToBeSaved = await dbManager.getTemporaryCards();

    for (int i = 0; i < cardsToBeSaved.length; i++) {
       dbManager.saveCard(cardsToBeSaved[0]);
       dbManager.deleteTemporaryCard(cardsToBeSaved[0]);
    }
    return;
  }
}