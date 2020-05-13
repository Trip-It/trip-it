import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:trip_it_app/services/nominatim.dart';

class MarkerPopup extends StatefulWidget {
  final Marker marker;

  MarkerPopup(this.marker, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MarkerPopupState(this.marker);
}

class _MarkerPopupState extends State<MarkerPopup> {
  final Marker _marker;
  String descr = "";


  _MarkerPopupState(this._marker);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Icon(Icons.info_outline),
            ),
            _cardDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _cardDescription(BuildContext context) {

    _lookupLocation(_marker.point.latitude, _marker.point.longitude);

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
              "Location: ",
              overflow: TextOverflow.fade,
              softWrap: false,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Text(
              "Location: " + descr,
              style: const TextStyle(fontSize: 12.0),
            ),
            Text(
              "Position: ${_marker.point.latitude}, ${_marker.point.longitude}",
              style: const TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }

  _lookupLocation(double lat, double lng) async{

    NominatimService service = new NominatimService();
    List<Map> locationInfo = await service.reverseGeocoding(lat, lng);

    setState(() {
      descr = "${locationInfo[0]['state']}, ${locationInfo[0]['city']}, ${locationInfo[0]['suburb']}, ${locationInfo[0]['neighbourhood']}, ${locationInfo[0]['road']}";
    });

  }

}
