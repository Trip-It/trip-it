import 'package:flutter/material.dart';
import 'package:trip_it_app/models/card.dart';
import 'package:trip_it_app/screens/about.dart';
import 'package:trip_it_app/screens/cards.dart';
import 'package:trip_it_app/screens/preferences.dart';
import 'package:trip_it_app/screens/profiles.dart';
import 'package:trip_it_app/screens/trip.dart';
import 'package:trip_it_app/theme.dart';

class SearchBarCards extends StatefulWidget {
  final cards;

  SearchBarCards(this.cards);

  @override
  State<StatefulWidget> createState() => new _SearchBarCardsState();

}


class _SearchBarCardsState extends State<SearchBarCards>{

  final cardsController = TextEditingController();
  List<ChargeCard> chargingCards = new List<ChargeCard>();

  //chargingCards.addAll(widget.cards);


  List<String> _newData = [];
/*

  void updateCardsController(String newQuery) {
    filteredRecored.clear();
    if (newQuery.length > 0) {
      Set<Country> set = Set.from(allRecord);
      set.forEach((element) => filterList(element, newQuery));
    }
    if (newQuery.isEmpty) {
      cards.addAll(allRecord);
    }
    setState(() {});
  }*/
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cardsController,
      autofocus:false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15.0),
        icon: Icon(Icons.search),
        hintText:"Search for one card",
      ),
      //onChanged: updateCardsController,
    );
  }
}
