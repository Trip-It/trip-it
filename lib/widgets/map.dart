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
  LatLng position = LatLng(45.171547, 	5.722387);
  bool followUser;

  /// Constructor to initialize widget, [followUser] sets if map stays centered
  /// on user location or not
  MapView(this.followUser);

  GlobalKey<OSMFlutterState> mapKey = GlobalKey<OSMFlutterState>();
  @override
  Widget build(BuildContext context) {
    markerlocationStream.stream.listen((onData) {
      // print(onData.latitude);
    });

    userLocationOptions = UserLocationOptions(
        context: context,
        mapController: mapController,
        markers: markers,
        onLocationUpdate: (LatLng pos) =>
            position = pos,
        updateMapLocationOnPositionChange: followUser,
        showMoveToCurrentLocationFloatingActionButton: true,
        zoomToCurrentLocationOnLoad: true,
        fabBottom: 50,
        fabRight: 50,
        verbose: false);

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
                    color: Colors.brown,
                  ),
                ),
                roadColor: Colors.blueAccent),
            markerIcon: MarkerIcon(
              icon: Icon(
                Icons.person_pin_circle,
                color: Colors.redAccent,
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