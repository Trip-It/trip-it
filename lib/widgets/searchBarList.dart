import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/about.dart';
import 'package:trip_it_app/screens/cards.dart';
import 'package:trip_it_app/screens/preferences.dart';
import 'package:trip_it_app/screens/profiles.dart';
import 'package:trip_it_app/screens/trip.dart';
import 'package:trip_it_app/theme.dart';

class SearchBarCards extends StatefulWidget {
  final imageCards;
  final titlesCards;

  SearchBarCards(this.imageCards, this.titlesCards);


  @override
  State<StatefulWidget> createState() => _SearchBarCardsState();

}


class _SearchBarCardsState extends State<SearchBarCards>{

  final cardsController = TextEditingController();


  List<String> _newData = [];

  changedData(String value) {
  setState(() {_newData = widget.titlesCards.where((string) => string.toLowerCase().contains(value.toLowerCase())).toList();});

  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cardsController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15.0),
        icon: Icon(Icons.search),
        hintText:"Search for one of your cards",
      ),
     // onChanged: changedData(cardsController.text),
    );
  }
}
