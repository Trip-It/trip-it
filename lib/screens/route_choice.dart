import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:trip_it_app/services/openroutingservice.dart';
import 'package:trip_it_app/screens/loader.dart';
import 'package:trip_it_app/widgets/map.dart';
import 'package:flutter_map/flutter_map.dart';

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
  Map routingInfo;
  bool _loading = true;
  MapController _mapController = MapController();


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
        body: _loading ?  Loader() : MapPage(lat: startLat, lng: startLng, mapController: _mapController, markers: null, coordinates: routingInfo['coordinates'], usePolyline: true,),
    );
  }


  /// Method to handle route request
  void getRoute() async{
    OpenRoutingService ors = OpenRoutingService();
    Map info= await ors.requestOSRM(startLat, startLng, destinationLat, destinationLng);
    setState(() {
      routingInfo = info;
      _loading = false;
    });

  }

}