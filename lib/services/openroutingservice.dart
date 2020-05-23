
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latlong/latlong.dart';

class OpenRoutingService {

  ///Routing method getting a suggested driving route with a start point and end point.
  Future<List<LatLng>> requestOSRM(double startlat, double startlng,
      double endlat, double endlng) async {
    ///Using of OSRM project for the routing service, the profile "driving" is for cars.
    ///For the future we can implement "bike" profile like the client needs
    ///geometries=geojson for not encoded coordinates
    var url =
        'http://router.project-osrm.org/route/v1/driving/q=$startlat,q=$startlng;q=$endlat,q=$endlng?geometries=geojson';
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var jsonResponse = jsonDecode(response.body); //Json format
    List<
        dynamic> coordinates = jsonResponse['coordinates']; //List of coordinates provide by the JSON response
    print('coordinates are : $coordinates');
    print('coordinates are: ${coordinates.length}');
    Map<String, dynamic> properties = jsonResponse['properties'];
    String distance = properties['distance'];
    print('Route is $distance Km long.');
    String instructions = properties['description'];
    print('instructions are $instructions');

    List<LatLng> suggestedRoute = [];
    for (int i = 0; i < (coordinates.length); i++) {
      dynamic coordinate = coordinates[i];
      LatLng position = LatLng(coordinate[1], coordinate[0]);
      suggestedRoute.add(position);
      print('position is $position');
      print(i);
    }
    print('suggestedRoute is $suggestedRoute');
    return suggestedRoute;
  }

}

