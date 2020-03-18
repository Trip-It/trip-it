import 'package:flutter/material.dart';
import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';

class SearchBar extends StatelessWidget {
  static const routeName = '/searchbar';
  static const API_KEY =
      'pk.eyJ1Ijoic2NoaWRsIiwiYSI6ImNrN2RkaDRzdTBta2MzbXBhcXByOWwxZnoifQ.PMQVxwHF6t00YTYstdvWHQ';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MapBoxPlaceSearchWidget(
        popOnSelect: true,
        apiKey: API_KEY,
        limit: 5,
        height: 400,
        searchHint: 'Search...',
        onSelected: (place) {
          print("ID" +
              place.id +
              "Center" +
              place.center
                  .toString()); // To access the location, use place.center, it gives the coordinates
        },
        context: context,
      ),
    );
  }
}
