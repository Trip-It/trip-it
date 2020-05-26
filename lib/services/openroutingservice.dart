import 'dart:io';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latlong/latlong.dart';

class OpenRoutingService {

  ///Routing method getting a suggested driving route with a start point and end point.
  Future<Map> requestOSRM(double startlat, double startlng,
      double endlat, double endlng) async {

    Map routingInfo;
    ///Using of OSRM project for the routing service, profile "driving-car" is for cars.
    ///For the future we can implement "bike" profile like the client needs
    ///specify 'directions' for routing service
    var url =
        'https://api.openrouteservice.org/v2/directions/driving-car/geojson';

    /// Authorization, giving the API Key used for ORS requests
    var header = {
      HttpHeaders.authorizationHeader: "5b3ce3597851110001cf62483d0ee3115a0e4df9a6fc57cdcd54a8dd",
      HttpHeaders.acceptHeader: "application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8",
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"};

    /// Body of the requests specifying the options
    var body = jsonEncode({"coordinates":[[startlng,startlat],[endlng,endlat]],"attributes":["avgspeed","percentage"],"elevation":"true","instructions":"false"});

    /// Launch http POST request
    var response = await http.post(
      url,
      headers: header,
      body: body);

    /// Print the response
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    /// Decode the response, which is a map (starts with curly brackets)
    Map jsonResponse = jsonDecode(response.body);

    /// Get the features of the route
    List features = jsonResponse['features'];

    /// Get the properties
    Map properties = features.elementAt(0)['properties'];
    Map geometry = features.elementAt(0)['geometry'];

    /// Extract the waypoints
    List<LatLng> waypoints = List<LatLng>();

    for (List coordinates in geometry['coordinates']){
      waypoints.add(LatLng(coordinates.elementAt(1), coordinates.elementAt(0)));
    }

    /// Extract the bounding box
    List boundingBox = jsonResponse['bbox'];
    LatLng firstCorner = LatLng(boundingBox.elementAt(1), boundingBox.elementAt(0));
    LatLng secondCorner = LatLng(boundingBox.elementAt(4),boundingBox.elementAt(3));
    LatLngBounds bbox = LatLngBounds(firstCorner, secondCorner);

    /// Get ascent, descent
    routingInfo = {
      'ascent' : properties['ascent'],
      'descent' : properties['descent'],
      'distance' : properties['summary']['distance'],
      'duration' : properties['summary']['duration'],
      'waypoints' : waypoints,
      'bbox' : bbox,
    };

    print(routingInfo.toString());

    return routingInfo;
  }

}

