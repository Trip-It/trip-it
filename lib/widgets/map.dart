import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';

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
        fabBottom: 30,
        fabRight: 10,
        verbose: false);

    return Container(
        child: Column(
          children: [
           Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: position,
                  zoom: 14,
                  plugins: [
                    UserLocationPlugin(), //Use user location on map
                  ],
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
                  MarkerLayerOptions(markers: markers),
                  userLocationOptions,
                ],
                mapController: mapController,
              ),
            ),
          ],
        ),
    );
  }

}