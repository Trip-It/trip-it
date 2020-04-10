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

  Future<void> initScreen()async{
    CardsManager dbManager = CardsManager();
    List<ChargeCard> myNewCards = await dbManager.getAllCards();
    print("-------------------- init screen-----------");
    setState(() {allCards = myNewCards;});

    print(allCards[1].toString());
  }

  @override
  Widget build(BuildContext context) {

    print("----------before init----------");
    initScreen();
    print("----------after init-----------");
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
  /// Method to save a card
  void saveInCurrentCard() async{
    CardsManager dbManager = CardsManager();
    cardsToBeSaved = await dbManager.getTemporaryCards();

    for (int i = 0; i < cardsToBeSaved.length; i++) {
       dbManager.saveCard(cardsToBeSaved[0]);
       dbManager.deleteTemporaryCard(cardsToBeSaved[0]);
    }
    return;
  }
}