import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trip_it_app/models/card.dart';
import 'package:trip_it_app/services/cards_manager.dart';
import 'package:trip_it_app/services/database_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/cards_list_view.dart';
import 'package:trip_it_app/widgets/search_bar_list.dart';

class AddCardScreen extends StatefulWidget {
  static const routeName = '/addCard';
  @override
  State<StatefulWidget> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  List<ChargeCard> allCards;
  List<ChargeCard> cardsToBeSaved;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _AddCardScreenState(){
    initScreen();
  }

  Future<void> initScreen() async {

    CardsManager dbManager = CardsManager();
    List<ChargeCard> myNewCards = await dbManager.getAllCards();
    setState(() {
      allCards = myNewCards;
    });

  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      key: _scaffoldKey,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            child: SearchBarCards(allCards),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            height: 240,
            child: CardsList(
              allCards,
              false,
            ),
          ),
        ],
      ),
    );
  }

  /// Method to save a card
  void saveInCurrentCard() async {
    CardsManager dbManager = CardsManager();
    cardsToBeSaved = await dbManager.getTemporaryCards();
    if (cardsToBeSaved.length!=0){

    for (int i = 0; i < cardsToBeSaved.length; i++) {
      // Save in usercards
      dbManager.saveCard(cardsToBeSaved[i]);
      // delete from temporaryards
      dbManager.deleteTemporaryCard(cardsToBeSaved[i]);
    }

    // Set depending on success of save/delete action
    bool success = true;

    // Give the SnackBar info about success of save/delete
    showSnackBar(success);}
    else{
      bool success = false;
      showSnackBar(success);

    }

    return;
  }

  /// Method to show the snack bar
  void showSnackBar(bool success) {

    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: success ? Colors.green : Colors.red, // Set color depending on success
        content: success? const Text(
          'Added to your Cards',
          style: TextStyle(color: Colors.white),
        )
        :const Text(
          'Nothing selected or Card already exists ',
          style: TextStyle(color: Colors.white),
        ),
        //action: SnackBarAction(
        //    label: 'DISMISS', onPressed: ,),
      ),
    );
  }
}
