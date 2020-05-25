import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:trip_it_app/services/openroutingservice.dart';
import 'package:trip_it_app/screens/loader.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/map.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sticky_headers/sticky_headers.dart';

class RouteChoiceScreen extends StatefulWidget {
  static const routeName = '/routechoice';
  final LatLng startPoint;
  final LatLng destinationPoint;

  /// Constructor
  RouteChoiceScreen(this.startPoint, this.destinationPoint);

  State<StatefulWidget> createState() =>
      _RouteChoiceScreenState(startPoint, destinationPoint);
}

class _RouteChoiceScreenState extends State<RouteChoiceScreen> {
  double startLat;
  double startLng;
  double destinationLat;
  double destinationLng;
  Map routingInfo;
  bool _loading = true;
  List information = List ();
  List<IconData> icons = [Icons.trending_up, Icons.trending_down, Icons.map, Icons.timer];
  MapController _mapController = MapController();
  /* routingInfo = {
  'ascent' : properties['ascent'],
  'descent' : properties['descent'],
  'distance' : properties['summary']['distance'],
  'duration' : properties['summary']['duration'],
  'coordinates' : geometry['coordinates'],
  };
*/

  _RouteChoiceScreenState(LatLng start, LatLng destination) {
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
      body: _loading
          ? Loader()
          : Container(
              child: DraggableScrollableSheet(
                  initialChildSize: 0.1,
                  minChildSize: 0.1,
                  maxChildSize: 0.45,
                  builder: (BuildContext context, myscrollController) {
                    return Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Container(
                              height: 45.0,
                              color: Colors.white,
                              padding:
                                  new EdgeInsets.symmetric(horizontal: 12.0),
                              alignment: Alignment.center,
                              child: new Text(
                                "Trip Information",
                                style: const TextStyle(
                                    color: TripItColors.primaryDarkBlue,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Expanded(
                              child: new GridView.builder(
                                shrinkWrap: true,
                                controller: myscrollController,
                                itemCount: 4,
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, childAspectRatio: 2),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    child: new Card(
                                      elevation: 5.0,
                                      color: Colors.white,
                                      child: Wrap(
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            child: new Icon(
                                              icons[index],
                                              color: TripItColors.primaryDarkBlue,
                                              size: 56.0,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: new Text(
                                                information.elementAt(index),
                                                style: TextStyle(
                                                    color: TripItColors.primaryDarkBlue,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              ),
                            ),
                          ],
                        ),
                      //),
                    );
                  }),
            ),
    );
  }

  /// Method to handle route request
  void getRoute() async {
    OpenRoutingService ors = OpenRoutingService();
    Map info = await ors.requestOSRM(
        startLat, startLng, destinationLat, destinationLng);
    setState(() {
      routingInfo = info;
      _loading = false;
      information.add(routingInfo['ascent'].toStringAsFixed(0)+"m");
      information.add(routingInfo['descent'].toStringAsFixed(0)+"m");
      double distanceKM = routingInfo['distance']/1000;
      information.add(distanceKM.toStringAsFixed(2)+"km");
      int durationH = (routingInfo['duration']/3600).toInt();
      int durationM = (routingInfo['duration']/60 - durationH*60).toInt();
      information.add(durationH.toString()+"h"+durationM.toString()+"min");
    });
  }
}
