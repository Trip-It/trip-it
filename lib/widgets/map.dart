import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

/// Map widget using Mapbox API
/// with [followUser] you can set whether or not the map should stay centered
/// on the most recent user location or not
class MapView extends StatelessWidget {
  ///Map controller to manage app
  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;
  StreamController<LatLng> markerlocationStream = StreamController();
  List<Marker> markers = [];
  LatLng position = LatLng(45.171547, 5.722387);
  bool followUser;

  /// Constructor to initialize widget
  MapView();

  GlobalKey<OSMFlutterState> mapKey = GlobalKey<OSMFlutterState>();
  @override
  Widget build(BuildContext context) {
    markerlocationStream.stream.listen((onData) {
      // print(onData.latitude);
    });

    return Container(
      child: Column(
        children: [
          Flexible(
            child: OSMFlutter(
              key: mapKey,
              currentLocation: true,
              road: Road(
                  startIcon: MarkerIcon(
                    icon: Icon(
                      Icons.person,
                      size: 64,
                    ),
                  ),
                  roadColor: Colors.blueAccent),
              markerIcon: MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  size: 56,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}