import 'package:flutter/material.dart';
import 'package:trip_it_app/models/card.dart';
import 'package:trip_it_app/services/cards_manager.dart';
import 'package:trip_it_app/screens/about.dart';
import 'package:trip_it_app/screens/cards.dart';
import 'package:trip_it_app/screens/preferences.dart';
import 'package:trip_it_app/screens/profiles.dart';
import 'package:trip_it_app/screens/trip.dart';
import 'package:trip_it_app/theme.dart';

class SearchBarCards extends StatefulWidget {
  final bool origin;

  SearchBarCards(this.origin);

  State<StatefulWidget> createState() => _SearchBarCardsState(origin);
}


class _SearchBarCardsState extends State<SearchBarCards> {
  List<ChargeCard> chargingCards = new List<ChargeCard>();
 // final cardsController = TextEditingController();
  TextEditingController _searchQuery;
  bool _isSearching = false;
  List<ChargeCard> filteredRecored;

  _SearchBarCardsState(bool origin) {
    if (origin == false) {
      initList();
    }
    else {
      initMyList();
    }
    filteredRecored = new List<ChargeCard>();
    filteredRecored.addAll(chargingCards);
  }

  //It'll open search box
  void _startSearch() {

    ModalRoute.of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }
  //It'll close search box.
  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
      filteredRecored.addAll(chargingCards);
    });
  }
  //clear search box data.
  void _clearSearchQuery() {
    setState(() {
      _searchQuery.clear();
      updateSearchQuery("Search query");
    });
  }
  //Creating search box widget
  @override
  Widget build(BuildContext context) {
    return new TextField(
      controller: _searchQuery,
      autofocus: true,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(15.0),
        icon: Icon(Icons.search),
        hintText: "Search for one card",
      ),
      style: const TextStyle(color: Colors.grey, fontSize: 16.0),
      onChanged: updateSearchQuery,
    );
  }
  //It'll update list items after searching complete.
  void updateSearchQuery(String newQuery) {
    filteredRecored.clear();
    if (newQuery.length > 0) {
      Set<ChargeCard> set = Set.from(chargingCards);
      set.forEach((element) => filterList(element, newQuery));
    }
    if (newQuery.isEmpty) {
      filteredRecored.addAll(chargingCards);
    }
    setState(() {});
    print("--------------------Local----------------------");
    print("SEARCH RESULT:"+ filteredRecored[0].toString());
    print("SEARCH RESULT:"+ filteredRecored[1].toString());
    print("SEARCH RESULT:"+ filteredRecored[2].toString());
    print("SEARCH RESULT:"+ filteredRecored[3].toString());
    print("SEARCH RESULT:"+ filteredRecored[4].toString());
    print("-----------------------------------------------");
  }
  //Filtering the list item with found match string.
  filterList(ChargeCard card, String searchQuery) {
    setState(() {
      if (card.name.toLowerCase().contains(searchQuery) ||
          card.name.contains(searchQuery)) {
        filteredRecored.add(card);
      }

      CardsManager dbManager = CardsManager();
      dbManager.deleteAllFilteredYourCard();
      for (int i = 0; i < filteredRecored.length; i++)
          dbManager.saveFilteredYourCard(filteredRecored[i]);

      initMyList();
      print("--------------------Database----------------------");
      print("SEARCH RESULT:"+ chargingCards[0].toString());
      print("SEARCH RESULT:"+ chargingCards[1].toString());
      print("SEARCH RESULT:"+ chargingCards[2].toString());
      print("SEARCH RESULT:"+ chargingCards[3].toString());
      print("SEARCH RESULT:"+ chargingCards[4].toString());
      print("-----------------------------------------------");

    });
  }

  //chargingCards.addAll(widget.cards);


  //List<String> _newData = [];

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

  /*Widget build(BuildContext context) {
    return TextField(
      controller: cardsController,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15.0),
        icon: Icon(Icons.search),
        hintText: "Search for one card",
      ),
      //onChanged: updateCardsController,
    );
  }*/


  void initList() async {
    CardsManager dbManager = CardsManager();
    List<ChargeCard> myNewCards = await dbManager.getAllCards();
    setState(() {
      if (myNewCards != null || myNewCards.isEmpty) {
        chargingCards = myNewCards;
      }
    });
  }

  void initMyList() async {
    CardsManager dbManager = CardsManager();
    List<ChargeCard> myNewCards = await dbManager.getCards();
    setState(() {
      if (myNewCards != null || myNewCards.isEmpty) {
        chargingCards = myNewCards;
      }
    });
  }
}