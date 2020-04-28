import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:trip_it_app/screens/loader.dart';
import 'package:trip_it_app/screens/destination.dart';
import 'package:trip_it_app/services/nominatim.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/map.dart';

class DestinationScreen extends StatefulWidget {
  static const routeName = '/destination';

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Map place;
  TextEditingController _ctrlStartSearch = TextEditingController();
  TextEditingController _ctrlDestinationSearch = TextEditingController();
  bool _isSearching = false;
  String _startDescr;
  String _destDescr;
  List _addresses = List();
  double _lat;
  double _lng;
  bool _destinationSearch;

  @override
  void dispose() {
    _ctrlStartSearch.dispose();
    super.dispose();
  }

  void _changeTextFormField(){
    setState(() {
      _isSearching = !_isSearching;
      if(!_isSearching) dispose();
    });
  }

  Widget searchOptions() {
    return new SizedBox(
        height:  MediaQuery.of(context).size.height * 0.63,
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
          color: Colors.transparent,
          child: ListView.builder(
            itemCount: _addresses.length,
            itemBuilder: (BuildContext ctx, int index) {
              return GestureDetector(
                child: _buildLocationCard(_addresses[index]['description']),
                onTap: () {
                  setState(() {
                    _destDescr = _addresses[index]['description'];/*"${_addresses[index]['country']}, ${_addresses[index]['state']}, ${_addresses[index]['city']}, ${_addresses[index]['city_district']}, ${_addresses[index]['suburb']}";*/
                    _isSearching = false;
                    _lat = double.parse(_addresses[index]['lat']);
                    _lng = double.parse(_addresses[index]['lng']);
                    place = {
                      'latlng': LatLng(_lat, _lng),
                      'state': _addresses[index]['state'],
                      'desc':
                      "${_addresses[index]['state']}, ${_addresses[index]['city']}, ${_addresses[index]['suburb']}, ${_addresses[index]['neighbourhood']}, ${_addresses[index]['road']}"
                    };
                  });
                },
              );
            },
          ),
        ),
    );
  }

  _buildLocationCard(String text) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: TripItColors.primaryLightBlue,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 0,
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: AutoSizeText(
                        text,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ))),
            ),
      ],
    );
  }

  onWillpop() {
    setState(() {
      _isSearching = false;
    });
  }

  _buildSearchBar(bool _isResult, TextEditingController _ctrl, String hint) {
    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: TextFormField(
                  controller: _ctrl,
                  decoration: InputDecoration(
                      hintText: hint,
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey)),
                  textInputAction: TextInputAction.search,
                  onEditingComplete: () async {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    _isResult == false
                        ? _changeTextFormField()
                        : setState(() {
                          _isSearching = true;
                        });
                    dynamic res = await NominatimService()
                        .getAddressLatLng(_ctrl.text);
                    setState(() {
                      _addresses = res;
                    });
                  },
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search, color: TripItColors.primaryDarkBlue),
              onPressed: () async {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                _isResult == false
                    ? _changeTextFormField()
                    : setState(() {
                  _isSearching = true;
                });
                dynamic res =
                    await NominatimService().getAddressLatLng(_ctrl.text);
                setState(() {
                  _addresses = res;
                });
              },
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Destination"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.directions,
                      color: TripItColors.primaryDarkBlue,
                    ),
                    IconButton(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      iconSize: 32,
                        icon: Icon(
                            Icons.import_export
                        ),
                        color: TripItColors.primaryLightBlue,
                        onPressed: () => {}),
                    Icon(Icons.flag, color: TripItColors.primaryDarkBlue),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  _buildSearchBar(_isSearching, _ctrlStartSearch, "Start Location"),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  ),
                  _buildSearchBar(_isSearching, _ctrlDestinationSearch, "Search Destination"),
                ],
              ),
            ],
          ),
          searchOptions(),

        ],
      ),
    );
  }
}
