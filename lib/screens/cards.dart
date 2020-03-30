import 'package:flutter/material.dart';
import 'package:trip_it_app/models/card.dart';
import 'package:trip_it_app/screens/addCard.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/cardsListView.dart';
import 'package:trip_it_app/widgets/searchBarList.dart';

class CardsScreen extends StatelessWidget {
  static const routeName = '/cards';

  @override
  Widget build(BuildContext context) {

    ChargeCard chargemapPass = ChargeCard("Chargemap Pass","assets/chargemap.png");
    ChargeCard izivia = ChargeCard("IZIVIA","assets/izivia-pass-006solo-1.jpg");
    ChargeCard kiwhi = ChargeCard("KiWhi","assets/carte_KiWhi-Passe-300x194.png");
    ChargeCard newMotion = ChargeCard("New Motion","assets/chargecard.png");
    ChargeCard plugsurfing = ChargeCard("Plugsurfing","assets/Pass-Plugsurfing.png");

    final cards = [
      chargemapPass,
      izivia,
      kiwhi,
      newMotion,
      plugsurfing
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cards"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            child: SearchBarCards(cards),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
              child: Text("You have "+cards.length.toString()+" cards",
                  style: TextStyle(color: Colors.black.withOpacity(0.4)),
                  textAlign: TextAlign
                      .left) // the number of cards should change with the length of the personal card database
              ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            height: 240,
            child: CardsList(cards),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, AddCardScreen.routeName);
          },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


