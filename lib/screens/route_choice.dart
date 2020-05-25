import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:trip_it_app/services/openroutingservice.dart';
import 'package:trip_it_app/screens/loader.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/map.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';

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
  PopupController _popupController = PopupController();
  List<Marker> _markers;


  _RouteChoiceScreenState(LatLng start, LatLng destination){
    /// Initialize the state variables
    startLat = start.latitude;
    startLng = start.longitude;
    destinationLat = destination.latitude;
    destinationLng = destination.longitude;

    _markers = [
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.top),
        width: 50.0,
        height: 50.0,
        point: new LatLng(startLat, startLng),
        builder: (ctx) => new Container(
            child: Icon(
              Icons.location_on,
              size: 50.0,
              color: TripItColors.primaryDarkBlue,
            )),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.top),
        width: 50.0,
        height: 50.0,
        point: new LatLng(destinationLat, destinationLng),
        builder: (ctx) => new Container(
            child: Icon(
              Icons.flag,
              size: 50.0,
              color: TripItColors.primaryDarkBlue,
            )),
      )
    ];

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
        body: Stack(children: <Widget>[
          _loading ?  Center(
            child: Loader(),
          ) : MapPage(
            lat: startLat,
            lng: startLng,
            mapController: _mapController,
            popupLayerController: _popupController,
            markers: _markers,
            coordinates: routingInfo['waypoints'],
            usePolyline: true,
            mapOptions:  MapOptions(
              plugins: [PopupMarkerPlugin()],
              onTap: (_) => _popupController.hidePopup(), /// hide popups if user taps on map
              center: LatLng(startLat, startLng),                 /// initial center position
              zoom: 18.0,                                 /// initial zoom level
            ),
          ),
          _loading ? Container() : _segmentedControlZoom(),
          ],
        ),
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

  /// Method which returns the zoom control Widget
  _segmentedControlZoom() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return new Positioned(
      bottom: height * 0.3,
      right: width * 0.05,
      child: Container(
        width: width * 0.1,
        child: Column(
          children: <Widget>[
            FittedBox(
              child: FloatingActionButton(
                  heroTag: "resize",
                  child: Icon(
                    Icons.crop_free,
                  ),
                  onPressed: () {
                    setState(() {
                      _mapController.fitBounds(
                          routingInfo['bbox'],
                          options: FitBoundsOptions(padding: EdgeInsets.all(40.0)));
                    });
                  }),
            ),
            Container(
              padding: EdgeInsets.all(2.0),
            ),
            FittedBox(
              child: FloatingActionButton(
                  heroTag: "plusZoom",
                  child: Icon(
                    Icons.add,
                  ),
                  onPressed: () {
                    if (_mapController.zoom < 19) {
                      setState(() {
                        _mapController.move(
                            _mapController.center, _mapController.zoom + 1);
                      });
                    }
                  }),
            ),
            Container(
              padding: EdgeInsets.all(2.0),
            ),
            FittedBox(
              child: FloatingActionButton(
                  heroTag: "minusZoom",
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    if (_mapController.zoom > 2) {
                      setState(() {
                        _mapController.move(
                            _mapController.center, _mapController.zoom - 1);
                      });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

}