///
///  License
///  Apache License 2.0
///  Copyright (c) 2020 Aliati Sotware, Lucas Finoti and João Pedro Martins
///

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatefulWidget {
  MapPage({
    Key key,
    @required this.lat,
    @required this.lng,
    @required this.mapController,
    @required this.usePolyline,
    @required this.coordinates,
    @required this.markers,
  }) : super(key: key);
  final List<Marker> markers;
  final double lat;
  final double lng;
  final MapController mapController;
  final bool usePolyline;
  final List coordinates;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Widget body(BuildContext context) {
    return new FlutterMap(
      mapController: widget.mapController,
      options: MapOptions(
        center: LatLng(widget.lat, widget.lng),
        zoom: 18.0,
      ),
      layers: [
        new TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a', 'b', 'c']
        ),
        widget.usePolyline ? Container() : MarkerLayerOptions(
          markers: widget.markers,
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
