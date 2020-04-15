import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/searchbar.dart';
import 'package:trip_it_app/widgets/drawer.dart';
import 'package:trip_it_app/widgets/map.dart';
import 'package:trip_it_app/widgets/nominatim_location_picker.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map _pickedLocation;
  var _pickedLocationText;

  Future getLocationWithNominatim() async {
    Map result = await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return NominatimLocationPicker(
            searchHint: 'Search place',
            awaitingForLocation: "Waiting to get your location",
          );
        });
    if (result != null) {
      setState(() => _pickedLocation = result);
    } else {
      return;
    }
  }

  RaisedButton nominatimButton(Color color, String name) {
    return RaisedButton(
      color: color,
      onPressed: () async {
        await getLocationWithNominatim();
      },
      textColor: Colors.white,
      child: Center(
        child: Text(name),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Trip it!"),
        ),
        drawer: DrawerWidget(),
        body: NominatimLocationPicker(
            searchHint: 'Search place',
            awaitingForLocation: "Waiting to get your location",
          ),
    );

  }
}