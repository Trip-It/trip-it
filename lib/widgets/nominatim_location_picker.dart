///
///  License
///  Apache License 2.0
///  Copyright (c) 2020 Aliati Sotware, Lucas Finoti and João Pedro Martins
///

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:trip_it_app/screens/loader.dart';
import 'package:trip_it_app/screens/trip.dart';
import 'package:trip_it_app/services/nominatim.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/map.dart';

class NominatimLocationPicker extends StatefulWidget {
  NominatimLocationPicker({
    this.searchHint = 'Search',
    this.awaitingForLocation = "Awaiting for you current location",
  });

  final String searchHint;
  final String awaitingForLocation;

  @override
  _NominatimLocationPickerState createState() =>
      _NominatimLocationPickerState();
}

class _NominatimLocationPickerState extends State<NominatimLocationPicker> {
  Map retorno;
  List _addresses = List();
  Color _color = TripItColors.primaryDarkBlue;
  TextEditingController _ctrlSearch = TextEditingController();
  Position _currentPosition;
  String _desc;
  bool _isSearching = false;
  double _lat;
  double _lng;
  MapController _mapController = MapController();
  List<Marker> _markers;
  LatLng _point;
  String error;
  double stdLat=45.2047435;
  double stdLng=5.7012957;
  

  @override
  void dispose() {
    _ctrlSearch.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _markers = [
      Marker(
        width: 50.0,
        height: 50.0,
        point: new LatLng(0.0, 0.0),
        builder: (ctx) => new Container(
            child: Icon(
          Icons.location_on,
          size: 50.0,
          color: _color,
        )),
      )
    ];
  }

  void _changeAppBar() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }

  _getCurrentLocation()  async {
   final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
   GeolocationStatus status = await geolocator.checkGeolocationPermissionStatus();
    if (status == GeolocationStatus.granted) {
      try {
       final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
     await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
       setState(() {
        _currentPosition = position;
        _getCurrentLocationMarker();
        _getCurrentLocationDesc();
       
      });
    });} on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied';
      }     
    };
    } else {
      setState(() {
         Position stdPos = Position(latitude: stdLat, longitude:  stdLng);
        _currentPosition = stdPos;
        _getCurrentLocationMarker();
        _getCurrentLocationDesc();
       
      });

      
    }
    
  }

  _getCurrentLocationMarker() {
    setState(() {
      _lat = _currentPosition.latitude;
      _lng = _currentPosition.longitude;
      _point = LatLng(_lat, _lng);
      _markers[0] = Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        builder: (ctx) => new Container(
          child: Icon(
            Icons.location_on,
            size: 50.0,
            color: _color,
          ),
        ),
      );
    });
  }

  _getCurrentLocationDesc() async {
    dynamic res = await NominatimService().getAddressLatLng(
        "${_currentPosition.latitude} ${_currentPosition.longitude}");
    setState(() {
      _addresses = res;
      _lat = _currentPosition.latitude;
      _lng = _currentPosition.longitude;
      _point = LatLng(_lat, _lng);
      retorno = {
        'latlng': _point,
        'state': _addresses[0]['state'],
        'desc':
            "${_addresses[0]['state']}, ${_addresses[0]['city']}, ${_addresses[0]['suburb']}, ${_addresses[0]['neighbourhood']}, ${_addresses[0]['road']}"
      };
      _desc = _addresses[0]['description'];
    });
  }

  onWillpop() {
    setState(() {
      _isSearching = false;
    });
  }

  _buildAppbar(bool _isResult) {
    return new AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      primary: true,
      title: _buildTextField(_isResult),
      leading: IconButton(
        icon: Icon(_isResult ? Icons.close : Icons.my_location, color: _color),
        onPressed: () {
          _isSearching
              ? setState(() {
                  _isSearching = false;
                })
              : _mapController.move(_point, 18);
          setState(() {
            _isSearching = false;
            _getCurrentLocationMarker();
          });
        },
      ),
    );
  }

  _buildTextField(bool _isResult) {
    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: TextFormField(
                  controller: _ctrlSearch,
                  decoration: InputDecoration(
                      hintText: widget.searchHint,
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey)),
                  textInputAction: TextInputAction.search,
                  onEditingComplete: () async {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    _isResult == false
                        ? _changeAppBar()
                        : setState(() {
                            _isSearching = true;
                          });
                    dynamic res = await NominatimService()
                        .getAddressLatLng(_ctrlSearch.text);
                    setState(() {
                      _addresses = res;
                    });
                  },
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search, color: _color),
              onPressed: () async {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                _isResult == false
                    ? _changeAppBar()
                    : setState(() {
                        _isSearching = true;
                      });
                dynamic res =
                    await NominatimService().getAddressLatLng(_ctrlSearch.text);
                setState(() {
                  _addresses = res;
                });
              },
            ),
          ],
        ));
  }

  Widget mapContext(BuildContext context) {
    while (_currentPosition == null) {
      return new Center(
        child: Loader(),
      );
    }

    return new MapPage(
      lat: _lat,
      lng: _lng,
      mapController: _mapController,
      markers: _markers,
    );
  }

  Widget _buildBody(BuildContext context) {
    return new Stack(
      children: <Widget>[
        mapContext(context),
        _isSearching ? Container() : _buildDescriptionCard(),
        _isSearching ? Container() : floatingActionButton(),
        _isSearching ? Container() : _segmentedControlZoom(),
        _isSearching ? searchOptions() : Text(''),
      ],
    );
  }

  Widget _buildDescriptionCard() {
    return new Positioned(
      bottom: MediaQuery.of(context).size.width * 0.05,
      right: MediaQuery.of(context).size.width * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            //height: MediaQuery.of(context).size.height * 0.15,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                child: Row(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.all(15),
                        child: Center(
                            child: Scrollbar(
                                child: new SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          reverse: false,
                          child: AutoSizeText(
                            _desc == null
                                ? widget.awaitingForLocation
                                : "SET AS DEPARTURE POINT: \n" + _desc,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        )))),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  floatingActionButton() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return new Positioned(
      bottom: height * 0.05,
      right: width * 0.1,
      child: Container(
        height: width * 0.15,
        width: width * 0.15,
        child: FittedBox(
          child: FloatingActionButton(
              heroTag: "nextScreen",
              child: Icon(
                Icons.arrow_forward,
              ),
              onPressed: () {
                setState(() {
                  _point = LatLng(
                      _currentPosition.latitude, _currentPosition.longitude);
                });
                // Go to next screen
                Navigator.pushNamed(context, TripScreen.routeName);
              }),
        ),
      ),
    );
  }

  Widget searchOptions() {
    return new WillPopScope(
      onWillPop: () async => onWillpop(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
          color: Colors.transparent,
          child: ListView.builder(
            itemCount: _addresses.length,
            itemBuilder: (BuildContext ctx, int index) {
              return GestureDetector(
                child: _buildLocationCard(_addresses[index]['description']),
                onTap: () {
                  _mapController.move(
                      LatLng(double.parse(_addresses[index]['lat']),
                          double.parse(_addresses[index]['lng'])),
                      19);

                  setState(() {
                    _desc = _addresses[index][
                        'description']; /*"${_addresses[index]['country']}, ${_addresses[index]['state']}, ${_addresses[index]['city']}, ${_addresses[index]['city_district']}, ${_addresses[index]['suburb']}";*/
                    _isSearching = false;
                    _lat = double.parse(_addresses[index]['lat']);
                    _lng = double.parse(_addresses[index]['lng']);
                    retorno = {
                      'latlng': LatLng(_lat, _lng),
                      'state': _addresses[index]['state'],
                      'desc':
                          "${_addresses[index]['state']}, ${_addresses[index]['city']}, ${_addresses[index]['suburb']}, ${_addresses[index]['neighbourhood']}, ${_addresses[index]['road']}"
                    };
                    _markers[0] = Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(double.parse(_addresses[index]['lat']),
                          double.parse(_addresses[index]['lng'])),
                      builder: (ctx) => new Container(
                        child: Icon(Icons.location_on, size: 50.0),
                      ),
                    );
                  });
                },
              );
            },
          ),
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
                borderRadius: BorderRadius.circular(15.0),
              ),
              //color: Colors.white,
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

  _segmentedControlZoom() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return new Positioned(
      bottom: height * 0.2,
      right: width * 0.05,
      child: Container(
        height: width * 0.22,
        width: width * 0.1,
        child: Column(
          children: <Widget>[
            FittedBox(
              child: FloatingActionButton(
                  heroTag: "plusZoom",
                  child: Icon(
                    Icons.add,
                  ),
                  onPressed: () {
                    if (_mapController.zoom < 19) {
                      setState(() {
                        _mapController.move(_mapController.center, _mapController.zoom + 1);
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
                        _mapController.move(_mapController.center, _mapController.zoom - 1);
                      });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppbar(_isSearching),
      body: _buildBody(context),
    );
  }
}
