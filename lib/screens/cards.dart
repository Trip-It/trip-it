import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/addCard.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/cardsListView.dart';
import 'package:trip_it_app/widgets/searchBarList.dart';

class CardsScreen extends StatelessWidget {
  static const routeName = '/cards';

  @override
  Widget build(BuildContext context) {
    final titlesCards = [
      'Chargemap Pass',
      'IZIVIA',
      'KiWhi',
      'New Motion',
      'Plugsurfing'
    ];

    final imageCards = [
      "assets/chargemap.png",
      "assets/izivia-pass-006solo-1.jpg",
      "assets/carte_KiWhi-Passe-300x194.png",
      "assets/chargecard.png",
      "assets/Pass-Plugsurfing.png"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cards"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            child: SearchBarCards(imageCards,titlesCards),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
              child: Text('You have 5 cards',
                  style: TextStyle(color: Colors.black.withOpacity(0.4)),
                  textAlign: TextAlign
                      .left) // the number of cards should change with the length of the personal card database
              ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            height: 240,
            child: CardsList(imageCards, titlesCards),
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


