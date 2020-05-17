import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:trip_it_app/services/nominatim.dart';
import 'package:trip_it_app/theme.dart';

class MarkerPopup extends StatefulWidget {
  final Marker marker;

  MarkerPopup(this.marker, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MarkerPopupState(this.marker);
}

class _MarkerPopupState extends State<MarkerPopup> {
  Marker _marker;
  String descr = "";

  _MarkerPopupState(Marker marker) {
    this._marker = marker;
    _lookupLocation(_marker.point.latitude, _marker.point.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          color: TripItColors.primaryLightBlue,
          width: 2.0,
        ),
      ),
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add_location,  color: TripItColors.primaryDarkBlue,),
                    onPressed: (){
                      /// Add location to the route planning
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.flag, color: TripItColors.primaryDarkBlue,),
                    onPressed: (){
                      /// Set location as destination
                    },
                  ),
                ]),
            _cardDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _cardDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Location: " + descr,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Text(
              "Coordinates: ${_marker.point.latitude}, ${_marker.point.longitude}",
              style: const TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }

  _lookupLocation(double lat, double lng) async {
    NominatimService service = new NominatimService();
    List<Map> locationInfo = await service.reverseGeocoding(lat, lng);

    setState(() {
      descr = "${locationInfo[0]['description'].toString()}";
    });
  }
}
