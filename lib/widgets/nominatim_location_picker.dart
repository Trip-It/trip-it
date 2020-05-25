///
///  License
///  Apache License 2.0
///  Copyright (c) 2020 Aliati Sotware, Lucas Finoti and João Pedro Martins
///

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:trip_it_app/screens/loader.dart';
import 'package:trip_it_app/screens/route_choice.dart';
import 'package:trip_it_app/services/nominatim.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/map.dart';
import '../services/nominatim.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';


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
  Map start;
  Map destination;
  List _addresses = List();
  Color _color = TripItColors.primaryDarkBlue;
  TextEditingController _ctrlStartSearch = TextEditingController();
  TextEditingController _ctrlDestSearch = TextEditingController();
  Position _currentPosition;
  String _desc;
  bool _isSearching = false;
  bool _searchingStart = false;
  bool _searchingDestination = false;
  bool _enteredStart = false;
  bool _enteredDest = false;
  bool _startup = true;
  double _lat;
  double _lng;
  double _startLat;
  double _startLng;
  double _destLat;
  double _destLng;
  MapController _mapController = MapController();
  PopupController _popupController = PopupController();
  List<Marker> _markers;
  LatLng _point;

  @override
  void dispose() {
    _ctrlStartSearch.dispose();
    _ctrlDestSearch.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _markers = [
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.top),
        width: 50.0,
        height: 50.0,
        point: new LatLng(0.0, 0.0),
        builder: (ctx) => new Container(
            child: Icon(
          Icons.location_on,
          size: 50.0,
          color: _color,
        )),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.top),
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

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getCurrentLocationMarker();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getCurrentLocationMarker() {
    setState(() {
      _lat = _currentPosition.latitude;
      _lng = _currentPosition.longitude;
      _point = LatLng(_lat, _lng);
      _markers[0] = Marker(
        anchorPos: AnchorPos.align(AnchorAlign.top),
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
      _getCurrentLocationDesc();
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
        'desc': "${_addresses[0]['state']}, ${_addresses[0]['city']}, ${_addresses[0]['suburb']}, ${_addresses[0]['neighbourhood']}, ${_addresses[0]['road']}",
        'city': "${_addresses[0]['city']}",
      };
      _desc = _addresses[0]['description'];

      if(!_startup) {
        _ctrlStartSearch.text = _desc;
        start = retorno;
        _enteredStart = true;
      } else {
        _startup = false;
      }
    });
  }

  onWillpop() {
    setState(() {
      _isSearching = false;
    });
  }

  /// Method to reset the bounds of the map such that it shows [destination]
  /// and [start]
  _resetBounds(){
    _mapController.fitBounds(LatLngBounds(start['latlng'],destination['latlng']));
  }

  /// Method to build the AppBar
  _buildAppbar(bool _isResult) {
    return new PreferredSize(
      preferredSize: Size.fromHeight(145.0), // here the desired height
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(_isResult ? Icons.close : Icons.my_location,
                      color: _color),
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

                ///Button which swaps start and destination
                _enteredStart
                ? IconButton(
                  icon: Icon(Icons.swap_vert, color: _color,
                  ),
                  onPressed: (){

                    /// Swap start and destination
                    String textToSwap = _ctrlStartSearch.text;
                    double latToSwap = _startLat;
                    double lngToSwap = _startLng;
                    Map placeToSwap = start;

                    setState(() {
                      /// Swap coordinates
                      _startLat = _destLat;
                      _startLng = _destLng;
                      _destLat = latToSwap;
                      _destLng = lngToSwap;

                      /// Swap place information Map
                      start = destination;
                      destination = placeToSwap;

                      /// Swap markers
                      _markers[0] = Marker(
                        anchorPos: AnchorPos.align(AnchorAlign.top),
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(_startLat, _startLng),
                        builder: (ctx) => new Container(
                          child: Icon(Icons.location_on, size: 50.0),
                        ),
                      );
                      _markers[1] = Marker(
                        anchorPos: AnchorPos.align(AnchorAlign.top),
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(_destLat, _destLng),
                        builder: (ctx) => new Container(
                          child: Icon(Icons.flag, size: 50.0),
                        ),
                      );

                      /// Swap TextField contents
                      _ctrlStartSearch.text = _ctrlDestSearch.text;
                      _ctrlDestSearch.text = textToSwap;

                      /// Reset the bounds of the map
                      _resetBounds();
                    });
                  },
                )
                : Container(),

                _enteredStart
                    ? IconButton(
                  icon: Icon(_isResult ? Icons.close : Icons.flag,
                      color: _color),
                  onPressed: () {
                    _isSearching
                        ? setState(() {
                      _isSearching = false;
                    })
                        :
                    setState(() {
                      _isSearching = false;
                    });
                  },
                )
                    : Container(),
              ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildStartTextField(_isResult),
                  _enteredStart ? _buildDestTextField(_isResult) : Container(),
                ],
              ),
            )

          ),
        ],
      ),
    );
  }

  _buildStartTextField(bool _isResult) {
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
                  controller: _ctrlStartSearch,
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
                        .getAddressLatLng(_ctrlStartSearch.text);
                    setState(() {
                      _addresses = res;
                      _searchingStart = true;
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
                        _searchingStart = true;
                      });
                dynamic res = await NominatimService()
                    .getAddressLatLng(_ctrlStartSearch.text);
                setState(() {
                  _addresses = res;
                });
              },
            ),
          ],
        ));
  }

  _buildDestTextField(bool _isResult) {
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
                  controller: _ctrlDestSearch,
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
                        .getAddressLatLng(_ctrlDestSearch.text);
                    setState(() {
                      _addresses = res;
                    });
                    _searchingDestination = true;
                    _mapController.fitBounds(LatLngBounds(LatLng(_startLat, _startLng),LatLng(_destLat,_destLng)));
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
                        _searchingDestination = true;
                      });
                dynamic res = await NominatimService()
                    .getAddressLatLng(_ctrlDestSearch.text);
                setState(() {
                  _addresses = res;
                });
              },
            ),
          ],
        ));
  }

  /// Method to create a new map Widget which displays the markers
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
      popupLayerController: _popupController,
      markers: _markers,                            /// markers that should be displayed
      mapOptions: MapOptions(
        plugins: [PopupMarkerPlugin()],
        onLongPress: _lookUpLocation,               /// use reverse geocoding to look up location of long press
        onTap: (_) => _popupController.hidePopup(), /// hide popups if user taps on map
        center: LatLng(_lat, _lng),                 /// initial center position
        zoom: 18.0,                                 /// initial zoom level
      ),
      usePolyline: false,
      coordinates: null,
    );
  }

  /// Method to look up a given location [latLng] using Nominatim reverse
  /// geocoding. Creates a marker at the location that has been looked up
  _lookUpLocation(LatLng latLng){

    setState(() {
      _markers.add(Marker(
        anchorPos: AnchorPos.align(AnchorAlign.top),
        width: 50.0,
        height: 50.0,
        point: latLng,
        builder: (ctx) => new Container(
          child: Icon(
            Icons.help,
            size: 50.0,
            color: _color,
      )),
      ));
    });

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
                        child: Scrollbar(
                                child: new SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          reverse: false,
                          child: AutoSizeText(
                            _getCardText(),
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        ))),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  String _getCardText(){

    String toReturn = "";

    if(_desc == null){
      toReturn = widget.awaitingForLocation;
    } else {
      if(_enteredDest){
        toReturn = "Start the calculation of your route\nfrom \t" + start['city'] + "\nto \t" + destination['city'];
      } else {
        toReturn = "Please enter your starting point and your destination";
      }
    }

    return toReturn;
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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => RouteChoiceScreen(LatLng(_startLat,_startLng), LatLng(_destLat,_destLng))));
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
                      'desc': "${_addresses[index]['state']}, ${_addresses[index]['city']}, ${_addresses[index]['suburb']}, ${_addresses[index]['neighbourhood']}, ${_addresses[index]['road']}",
                      'city': "${_addresses[0]['city']}",
                    };

                    IconData iconToUseForMarker;
                    int markerIndex;

                    if(_searchingDestination){
                      /// The entered location is the destination
                      _destLat = _lat;
                      _destLng = _lng;
                      iconToUseForMarker = Icons.flag;
                      destination = retorno;

                      /// Add a new marker
                      _markers[1] = Marker(
                          anchorPos: AnchorPos.align(AnchorAlign.top),
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(double.parse(_addresses[index]['lat']),
                            double.parse(_addresses[index]['lng'])),
                        builder: (ctx) => new Container(
                          child: Icon(iconToUseForMarker, size: 50.0)));

                      /// Update text in TextField
                      _ctrlDestSearch.text = _desc;

                      /// Destination has been entered
                      _enteredDest = true;

                      /// Stopped searching for the destination
                      _searchingDestination = false;

                      /// Reset bounds of the map
                      _resetBounds();

                    } else {

                      /// The entered location is the starting point
                      _startLat= _lat;
                      _startLng= _lng;
                      iconToUseForMarker = Icons.location_on;
                      start = retorno;

                      /// Change the marker
                      _markers[0] = Marker(
                        anchorPos: AnchorPos.align(AnchorAlign.top),
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(double.parse(_addresses[index]['lat']),
                            double.parse(_addresses[index]['lng'])),
                        builder: (ctx) => new Container(
                          child: Icon(iconToUseForMarker, size: 50.0),
                        ),
                      );

                      /// Update text in TextField
                      _ctrlStartSearch.text = _desc;

                      /// Start has been entered
                      _enteredStart = true;

                      /// Stopped searching for starting point
                      _searchingStart = false;
                    }
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
                side: BorderSide(
                  color: TripItColors.primaryLightBlue,
                  width: 2.0,
                ),
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
      bottom: height * 0.3,
      right: width * 0.05,
      child: Container(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppbar(_isSearching),
      body: _buildBody(context),
    );
  }
}
