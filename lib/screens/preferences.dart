import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/cars_dropdown.dart';

class PreferencesScreen extends StatelessWidget {
  static const routeName = '/preferences';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferences"),
      ),
      body: ListView(
        padding: EdgeInsets.all(12.0),
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: TripItColors.primaryLightBlue,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: new EdgeInsets.all(2.0),
              child: new Column(
                children: <Widget>[
                  CarsDropdownWidget(),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
