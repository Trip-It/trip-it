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
  List<ChargeCard> filteredCards = new List<ChargeCard>();

  // final cardsController = TextEditingController();
  TextEditingController _searchQuery;
  bool _isSearching = false;
  List<ChargeCard> filteredRecored;

  // Constructor
  _SearchBarCardsState(bool origin) {
    if (origin == false) {
      initList();
    }
    else {
      initMyList();
    }
    filteredRecored = new List<ChargeCard>();
    filteredRecored.addAll(chargingCards);
    if (filteredRecored.isNotEmpty && filteredRecored!=null){
      print("filteredRecored BEGINING!!!!!"+ filteredRecored[0].toString());}
    fillFilteredList(filteredRecored);
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
  Future<void> updateSearchQuery(String newQuery) async{
    filteredRecored.clear();
    CardsManager dbManager = CardsManager();
    if (newQuery.length > 0) {
      print("-------Only some cards are being filtered---------");
      Set<ChargeCard> set = Set.from(chargingCards);
      set.forEach((element) => filterList(element, newQuery));
      await dbManager.deleteAllFilteredYourCard();
      for (int i = 0; i < filteredRecored.length; i++)
        await dbManager.saveFilteredYourCard(filteredRecored[i]);
    } else { //if (newQuery.isEmpty)
      print("-------No cards are being filtered---------");
      filteredRecored.addAll(chargingCards);
      await dbManager.deleteAllFilteredYourCard();
      for (int i = 0; i < filteredRecored.length; i++)
        await dbManager.saveFilteredYourCard(filteredRecored[i]);
    }

    //setState(() {
    //});

    initFilteredList();
    print("--------------------Database----------------------");
    print("SEARCH RESULT:"+ filteredCards[0].toString());
    print("SEARCH RESULT:"+ filteredCards[1].toString());
    print("-----------------------------------------------");
    //print("--------------------Local----------------------");
    //print("SEARCH RESULT:"+ filteredRecored[0].toString());
    //print("SEARCH RESULT:"+ filteredRecored[1].toString());
    //print("-----------------------------------------------");
  }

  //Filtering the list item with found match string.
  filterList(ChargeCard card, String searchQuery) {
    print("DEBUG::filterList()");
    //print("-------Only some cards are being filtered2---------");
    setState(() {
      if (card.name.toLowerCase().contains(searchQuery) ||
          card.name.contains(searchQuery)) {
        //print("-------Only some cards are being filtered3---------");
        filteredRecored.add(card);
        print("DEBUG::filteredRecored : \n" + filteredRecored.toString() );
      }
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
      if (myNewCards != null && myNewCards.isNotEmpty) {
        chargingCards = myNewCards;
      }
    });
    return ;
  }

  void initMyList() async {
    CardsManager dbManager = CardsManager();
    List<ChargeCard> myNewCards = await dbManager.getCards();
    setState(() {
      if (myNewCards != null && myNewCards.isNotEmpty) {
        chargingCards = myNewCards;
      }
    });
    return ;
  }
  void initFilteredList() async {
    CardsManager dbManager = CardsManager();
    List<ChargeCard> myNewCards = await dbManager.getFilteredYourCards();
    setState(() {
      if(myNewCards != null && myNewCards.isNotEmpty) {
        filteredCards = myNewCards;
      }
    });
    return ;
  }


  void fillFilteredList(filteredRecored1) async {
    CardsManager dbManager = CardsManager();
    for (int i = 0; i < filteredRecored1.length; i++) {
      await dbManager.saveFilteredYourCard(filteredRecored1[i]);
    }
    return ;
  }
}