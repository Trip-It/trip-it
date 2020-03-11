import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var markers = <Marker>[
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(45.171547, 	5.722387),
        builder: (ctx) => Container(
          child: Image.asset("assets/position_mark.png"),
        ),
      ),
    ];

    return Container(
        child: Column(
          children: [
           Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(45.171547, 	5.722387),
                  zoom: 14,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: "https://api.mapbox.com/v4/"
                    "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                    additionalOptions: {
                      'accessToken': 'pk.eyJ1Ijoic2NoaWRsIiwiYSI6ImNrN2RkaDRzdTBta2MzbXBhcXByOWwxZnoifQ.PMQVxwHF6t00YTYstdvWHQ',
                      'id': 'mapbox.streets',
                    },
                  ),
                  MarkerLayerOptions(markers: markers)
                ],
              ),
            ),
          ],
        ),
    );
  }

}