import 'package:flutter/material.dart';
import 'package:trip_it_app/models/card.dart';
import 'package:trip_it_app/services/cards_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:trip_it_app/services/database_manager.dart';

class CardsList extends StatefulWidget {
  final cards;
  final bool deleteEnable;
  CardsList(this.cards, this.deleteEnable);


  State<StatefulWidget> createState() => _CardsListState();
}
class _CardsListState extends State<CardsList> {
  IconData checkIcon = Icons.check_box_outline_blank;
  IconData newIcon = Icons.check_box;

  @override
  Widget build(BuildContext context) {
    if (widget.cards == null) {
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
        itemCount: widget.cards.length,
        itemBuilder: (context, index) {
          return Container(
            width: 260.0,
            child: Card(
              child: Wrap(
                children: <Widget>[
                  Image.asset(widget.cards[index].image, height: 194, width: 300),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 6.0, left: 12.0, right: 6.0, bottom: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: new InkWell(
                              child: Text(widget.cards[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              onTap: () { launch(widget.cards[index].url);}
                          ),
                        ),
                        Container(
                          child:(widget.deleteEnable)? new InkWell(
                              child: Icon(Icons.delete, color: Colors.grey),
                              onTap: () { deleteSelectedCard(widget.cards[index]);}
                             )
                            :new InkWell(
                            child: Icon(checkIcon),
                            /*onTap: tappedCheckBox(widget.cards[index])*/),

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

   /*tappedCheckBox(ChargeCard card) async{
        addSelectedCard(card);
        setState(() {checkIcon = newIcon;});
   }
  */

  void deleteSelectedCard(ChargeCard card) async {
    CardsManager dbManager = CardsManager();
    dbManager.deleteCard(card);
    return;
  }
  void addSelectedCard(ChargeCard card) async{
    CardsManager dbManager = CardsManager();
    dbManager.saveTemporaryCard(card);
    return;
  }
}
