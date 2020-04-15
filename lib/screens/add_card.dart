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

  Future<void> initScreen()async{
    CardsManager dbManager = CardsManager();
    print("-------------------- init screen1-----------");
    List<ChargeCard> myNewCards = await dbManager.getAllCards();
    print("-------------------- init screen2-----------");
    setState(() {allCards = myNewCards;});

    print(allCards[1].toString());
  }

  @override
  Widget build(BuildContext context) {

    print("----------before init----------");
    initScreen();
    print("----------after init-----------");
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Add Card"),
          centerTitle: true,
        ),
        floatingActionButton:new FloatingActionButton(
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
       dbManager.saveCard(cardsToBeSaved[i]);
       dbManager.deleteTemporaryCard(cardsToBeSaved[i]);
    }
    
    showSnackBar(context);
    
    return;
  }
  
  /// Method to show the snack bar
  void showSnackBar(BuildContext context) {
    final scaffold = Scaffold.of(context);
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: const Text('Added to your Cards'),
        action: SnackBarAction(
            label: 'DISMISS', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}