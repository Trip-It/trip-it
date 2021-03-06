///
///  License
///  Apache License 2.0
///  Copyright (c) 2020 Aliati Sotware, Lucas Finoti and João Pedro Martins
///

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/marker_popup.dart';

class MapPage extends StatefulWidget {
  MapPage({
    Key key,
    @required this.lat,
    @required this.lng,
    @required this.mapController,
    @required this.popupLayerController,
    @required this.usePolyline,
    @required this.coordinates,
    @required this.markers,
    @required this.mapOptions,
  }) : super(key: key);
  final List<Marker> markers;
  final double lat;
  final double lng;
  final MapController mapController;
  final MapOptions mapOptions;
  final PopupController popupLayerController;
  final bool usePolyline;
  final List coordinates;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Widget body(BuildContext context) {

    return new FlutterMap(
      mapController: widget.mapController,
      options: widget.mapOptions,
      layers: [
        new TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a', 'b', 'c']
        ),
        widget.usePolyline ? PolylineLayerOptions(
          polylines: [
            Polyline(
              points: widget.coordinates,
              strokeWidth: 5.0,
              color: TripItColors.primaryDarkBlue,
            )
          ]
        ) : MarkerLayerOptions(
          markers: widget.markers,
        ),
        PopupMarkerLayerOptions(
          markers: widget.markers,
          popupSnap: PopupSnap.top,
          popupController: widget.popupLayerController,
          popupBuilder: (BuildContext _, Marker marker) => MarkerPopup(marker),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: body(context),
    );
  }
}
