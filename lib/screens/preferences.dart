import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/dropdown.dart';
import 'package:trip_it_app/widgets/charge_slider.dart';
import 'package:trip_it_app/widgets/checkbox_options.dart';
import 'package:trip_it_app/widgets/switch_options.dart';

class PreferencesScreen extends StatelessWidget {
  static const routeName = '/preferences';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Preferences"),
        ),
      body: ListView(
        padding: EdgeInsets.all(12.0),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: TripItColors.primaryLightBlue,
                borderRadius: BorderRadius.circular(10)),
            padding: new EdgeInsets.all(2.0),
            child: new Column(
              children: <Widget>[
                DropdownWidget("Choose a car",["Zoe R90 22kWh","Zoe R90 41kWh","Zoe R110 52kWh"]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            decoration: BoxDecoration(
                color: TripItColors.primaryLightBlue,
                borderRadius: BorderRadius.circular(10)),
            padding: new EdgeInsets.all(2.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  ChargeSliderWidget(5, 20, 10, "Minimum charge"),
                  ChargeSliderWidget(30, 100, 80, "Maximum charge"),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            decoration: BoxDecoration(
                color: TripItColors.primaryLightBlue,
                borderRadius: BorderRadius.circular(10)),
            padding: new EdgeInsets.all(2.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  CheckboxOptionsWidget("Restaurant"),
                  CheckboxOptionsWidget("Cinema"),
                  CheckboxOptionsWidget("Sport"),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            decoration: BoxDecoration(
                color: TripItColors.primaryLightBlue,
                borderRadius: BorderRadius.circular(10)),
            padding: new EdgeInsets.all(2.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: SwitchOptionsWidget("Plug", "Estimation"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            decoration: BoxDecoration(
                color: TripItColors.primaryLightBlue,
                borderRadius: BorderRadius.circular(10)),
            padding: new EdgeInsets.all(2.0),
            child:Column(
                    children: <Widget>[
                      DropdownWidget("Choose a language", ["English","Français","Deutsch","Espagnol"]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            decoration: BoxDecoration(
                color: TripItColors.primaryLightBlue,
                borderRadius: BorderRadius.circular(10)),
            padding: new EdgeInsets.all(2.0),
            child:Column(
              children: <Widget>[
                DropdownWidget("Choose a map type", ["Satellite","Normal","Hybrid"]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
