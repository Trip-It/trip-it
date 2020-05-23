import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:trip_it_app/services/openroutingservice.dart';

class RouteChoiceScreen extends StatefulWidget {
  static const routeName = '/routechoice';
  final LatLng startPoint;
  final LatLng destinationPoint;


  /// Constructor
  RouteChoiceScreen(this.startPoint, this.destinationPoint);

  State<StatefulWidget> createState() => _RouteChoiceScreenState(startPoint, destinationPoint);
}


class _RouteChoiceScreenState extends State<RouteChoiceScreen> {
  double startLat;
  double startLng;
  double destinationLat;
  double destinationLng;
  List<LatLng> waypoints;

  _RouteChoiceScreenState(LatLng start, LatLng destination){
    /// Initialize the state variables
    startLat = start.latitude;
    startLng = start.longitude;
    destinationLat = destination.latitude;
    destinationLng = destination.longitude;

    /// Set up the routing request
    getRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Choose your trip"),
        ),
        body: Center(
          child: Text("Coordinates for your trip: \nStart: " + startLat.toString() + " : " + startLng.toString()
              + "\nDestination: " + destinationLat.toString() + " : " + destinationLng.toString()),
        ));
  }


  /// Method to handle route request
  void getRoute() async{
    OpenRoutingService ors = OpenRoutingService();
    waypoints = await ors.requestOSRM(startLat, startLng, destinationLat, destinationLng);
  }

}