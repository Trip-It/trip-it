import 'package:flutter/material.dart';
import 'package:trip_it_app/models/card.dart';
import 'package:trip_it_app/services/cards_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class CardsList extends StatefulWidget {
  final cards;
  final bool deleteEnable;

  CardsList(this.cards, this.deleteEnable);

  State<StatefulWidget> createState() => _CardsListState(cards);
}

class _CardsListState extends State<CardsList> {
  IconData checkIcon = Icons.check_box_outline_blank;
  IconData newIcon = Icons.check_box;
  List<ChargeCard> cards = new List();
  List<IconData> iconList = new List(7);

  _CardsListState(List<ChargeCard> cards) {
    print("DEBUG::_CardsListState::_CardsListState()");
    this.cards = cards;
    if (cards != null) {
      for (int i = 0; i < 6; i++) {
        iconList[i] = checkIcon;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if(!widget.deleteEnable){
      initList();
    }
    if (cards == null || cards.isEmpty) {
      return Container(
        width: 360.0,
        child: Card(
          child: Wrap(children: <Widget>[
            Image.asset("assets/NoCardsImage.png", height: 225, width: 500),
          ]),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Container(
            width: 260.0,
            child: Card(
              child: Wrap(
                children: <Widget>[
                  Image.asset(cards[index].image, height: 194, width: 300),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 6.0, left: 12.0, right: 6.0, bottom: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: new InkWell(
                              child: Text(cards[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              onTap: () {
                                launch(cards[index].url);
                              }),
                        ),
                        Container(
                          child: (widget.deleteEnable)
                              ? new InkWell(
                                  child: Icon(Icons.delete, color: Colors.grey),
                                  onTap: () {
                                    deleteSelectedCard(cards[index]);
                                  })
                              : new InkWell(
                                  child: iconList.isEmpty ? Icon(Icons.error_outline, color: Colors.grey,) : Icon(iconList[index]),
                                  onTap: () {
                                    tappedCheckBox(cards[index], index);
                                  }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }, //Remove semicolon
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      );
    }
  }

  void initList() async {
    print("DEBUG: initList()");
    CardsManager dbManager = CardsManager();
    List<ChargeCard> myNewCards = await dbManager.getAllCards();
    setState(() {
      if(myNewCards != null || myNewCards.isEmpty) {
        print("DEBUG: Cards returned from database is either null or empty!");
        cards = myNewCards;
      }
    });
  }

  void tappedCheckBox(ChargeCard card, int index) async {
    print("DEBUG::Called method: _CardsListState::tappedCheckBox()");
    addSelectedCard(card);
    setState(() {
      iconList[index] = newIcon;
    });
  }

  void deleteSelectedCard(ChargeCard card) async {
    print("DEBUG::Called method: _CardsListState::deletedSelectedCard()");
    CardsManager dbManager = CardsManager();
    dbManager.deleteCard(card);
    return;
  }

  void addSelectedCard(ChargeCard card) async {
    print("DEBUG::Called method: _CardsListState::addSelectedCard()");
    CardsManager dbManager = CardsManager();
    dbManager.saveTemporaryCard(card);
    /*List<ChargeCard> userCards = await dbManager.getCards();
    print(userCards[1].toString());*/
    return;
  }
}
