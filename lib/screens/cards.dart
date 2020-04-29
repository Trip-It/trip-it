import 'package:flutter/material.dart';
import 'package:trip_it_app/models/card.dart';
import 'package:trip_it_app/screens/add_card.dart';
import 'package:trip_it_app/services/cards_manager.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/services/database_manager.dart';
import 'package:trip_it_app/widgets/cards_list_view.dart';
import 'package:trip_it_app/widgets/search_bar_list.dart';

class CardsScreen extends StatefulWidget {
  static const routeName = '/cards';

  @override
  State<StatefulWidget> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  List<ChargeCard> myCards;
  Future<void> initScreen() async {
    CardsManager dbManager = CardsManager();
    List<ChargeCard> myNewCards = await dbManager.getCards();
    setState(() {
      myCards = myNewCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    initScreen();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Your Cards"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AddCardScreen.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            child: SearchBarCards(myCards),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            child: (myCards == null || myCards.isEmpty)
                ? Text("You have no cards registred",
                    style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    textAlign: TextAlign.left)
                : Text("You have " + myCards.length.toString() + " cards",
                    style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    textAlign: TextAlign
                        .left), // the number of cards should change with the length of the personal card database
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            height: 240,
            child: CardsList(
              myCards,
              true,
            ),
          ),
        ],
      ),
    );
  }
/*
    ChargeCard chargemapPass = ChargeCard(
        "Chargemap Pass", "assets/chargemap.png", "https://chargemap.com");
    ChargeCard izivia = ChargeCard(
        "IZIVIA", "assets/izivia-pass-006solo-1.jpg", "https://www.izivia.com");
    ChargeCard kiwhi = ChargeCard(
        "KiWhi",
        "assets/carte_KiWhi-Passe-300x194.png",
        "https://www.easytrip.fr/kiwhi-pass-particuliers");
    ChargeCard newMotion = ChargeCard(
        "New Motion", "assets/chargecard.png", "https://newmotion.com/");
    ChargeCard plugsurfing = ChargeCard("Plugsurfing",
        "assets/Pass-Plugsurfing.png", "https://www.plugsurfing.com/home");

    final cards = [chargemapPass, izivia, kiwhi, newMotion, plugsurfing];
*/

}
