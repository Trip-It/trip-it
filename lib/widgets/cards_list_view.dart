import 'package:flutter/material.dart';
import 'package:trip_it_app/models/card.dart';
import 'package:trip_it_app/services/cards_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:trip_it_app/services/database_manager.dart';

class CardsList extends StatefulWidget {
  final cards;
  final bool deleteEnable;
  CardsList(this.cards, this.deleteEnable);


  State<StatefulWidget> createState() => _CardsListState(cards);
}
class _CardsListState extends State<CardsList> {
  IconData checkIcon = Icons.check_box_outline_blank;
  IconData newIcon = Icons.check_box;
  List<ChargeCard> cards;
  List<IconData> iconList;

  _CardsListState(List<ChargeCard>cards){
    this.cards = cards;
    if (cards != null) {
      iconList = new List(cards.length);}
  }





  @override
  Widget build(BuildContext context) {


    if (cards == null) {
      return Container(
        width: 360.0,
        child: Card(
          child: Wrap(children: <Widget>[
            Image.asset("assets/NoCardsImage.png", height: 225, width: 500),
          ]),
        ),
      );
    } else {
      for (int i = 0; i < cards.length; i++) {
        iconList[i] = checkIcon;}
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
                              onTap: () { launch(cards[index].url);}
                          ),
                        ),
                        Container(
                          child:(widget.deleteEnable)? new InkWell(
                              child: Icon(Icons.delete, color: Colors.grey),
                              onTap: () { deleteSelectedCard(cards[index]);}
                             )
                            :new InkWell(

                            child: Icon(iconList[index]),
                            onTap: () { tappedCheckBox(cards[index],index);}),

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

   void tappedCheckBox(ChargeCard card, int index) async{
        addSelectedCard(card);
        setState(() {
          iconList[index] = newIcon;}
          );
   }

  void deleteSelectedCard(ChargeCard card) async {
    CardsManager dbManager = CardsManager();
    dbManager.deleteCard(card);
    return;
  }
  void addSelectedCard(ChargeCard card) async{
    CardsManager dbManager = CardsManager();
    dbManager.saveTemporaryCard(card);
    /*List<ChargeCard> userCards = await dbManager.getCards();
    print(userCards[1].toString());*/
    return;
  }
}
