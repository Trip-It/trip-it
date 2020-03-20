import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/about.dart';
import 'package:trip_it_app/screens/cards.dart';
import 'package:trip_it_app/screens/preferences.dart';
import 'package:trip_it_app/screens/profiles.dart';
import 'package:trip_it_app/screens/trip.dart';
import 'package:trip_it_app/theme.dart';

class CardsList extends StatelessWidget {
  final imageCards;
  final titlesCards;

  CardsList(this.imageCards,this.titlesCards);

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      itemCount: titlesCards.length,
      itemBuilder: (context, index) {
        return Container(
              width: 260.0,
              child: Card(
                  child: Wrap(
                    children: <Widget>[
                     Image.asset(imageCards[index], height: 194, width: 300),
                     Container(
                       child: Padding(
                         padding: EdgeInsets.only(top: 6.0, left: 12.0, right: 6.0, bottom: 6.0),
                            child: Text(titlesCards[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                     ),
                     ),
                  ],
                ),
              ),
            );}, //Remove semicolon
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
    );
  }
}
