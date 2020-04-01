import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import  'package:nominatim_location_picker/nominatim_location_picker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:nominatim_location_picker/src/services/nominatim.dart';



class SearchBar extends StatefulWidget {
  SearchBar({
  this.searchHint = 'Search',
  this.awaitingForLocation = "Awaiting for you current location",
  this.customMarkerIcon,
});
  static const routeName = '/searchbar';
  static LatLng newPos=LatLng(45.171547, 	5.722387) ;

  final String searchHint;
  final String awaitingForLocation;
  //
  final Widget customMarkerIcon;


  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  List _addresses = List();
  Color _color = Colors.black;
  TextEditingController _ctrlSearch = TextEditingController();

  String _desc;
  bool _isSearching = false;
  double _lat;
  double _lng;
  MapController _mapController = MapController();

  List<Marker> _markers;

  LatLng _point;

  @override
  void dispose() {
    _ctrlSearch.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _markers = [
      /*
      --- manage marker
    */
      Marker(
        width: 50.0,
        height: 50.0,
        point: new LatLng(0.0, 0.0),
        builder: (ctx) => new Container(
            child: widget.customMarkerIcon == null
                ? Icon(
              Icons.location_on,
              size: 50.0,
            )
                : widget.customMarkerIcon),
      )
    ];
  }
  void _changeAppBar() {
    /*
    --- manage appbar state
  */
    setState(() {
      _isSearching = !_isSearching;
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
        icon:
        Icon(_isResult ? Icons.close : Icons.arrow_back_ios, color: _color),
        onPressed: () {
          _isSearching
              ? setState(() {
            _isSearching = false;
          })
              : Navigator.of(context).pop();
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          setState(() {
            _isSearching = false;
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
                        hintStyle: TextStyle(color: Colors.grey))),
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
  Widget _buildBody(BuildContext context) {

    return new Stack(
      children: <Widget>[

        _isSearching ? Container() : _buildDescriptionCard(),

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
            height: MediaQuery.of(context).size.height * 0.15,
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
                                    _desc == null ? widget.awaitingForLocation : _desc,
                                    style: TextStyle(fontSize: 20),
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

  Widget searchOptions() {

    return new WillPopScope(
      onWillPop: () async => onWillpop(), //Bloquear o retorno
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

                    _markers[0] = Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(double.parse(_addresses[index]['lat']),
                          double.parse(_addresses[index]['lng'])),
                      builder: (ctx) => new Container(
                          child: widget.customMarkerIcon == null
                              ? Icon(
                            Icons.location_on,
                            size: 50.0,
                          )
                              : widget.customMarkerIcon),
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
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ))),
        ),
      ],
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

