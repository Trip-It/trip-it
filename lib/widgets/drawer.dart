import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/about.dart';
import 'package:trip_it_app/screens/cards.dart';
import 'package:trip_it_app/screens/preferences.dart';
import 'package:trip_it_app/screens/profiles.dart';
import 'package:trip_it_app/screens/trip.dart';
import 'package:trip_it_app/screens/test.dart';
import 'package:trip_it_app/theme.dart';

class DrawerWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: Container(
      color: TripItColors.primaryDarkBlue,
      child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          child: new DrawerHeader(child: Image.asset("assets/tripit_logo.png")),
          color: TripItColors.primaryLightBlue,
        ),
        Container(
          child: ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            title: Text('Your profile',
              style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.pushNamed(context, ProfilesScreen.routeName);
            },
          ),
          color: TripItColors.primaryDarkBlue,
        ),
        Container(
          child: ListTile(
            title: Text('New trip',
            style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.pushNamed(context, TripScreen.routeName);
            },
          ),
          color: TripItColors.primaryDarkBlue,
        ),
        Container(
          child: ListTile(
            title: Text('Your preferences',
              style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.pushNamed(context, PreferencesScreen.routeName);
            },
          ),
          color: TripItColors.primaryDarkBlue,
        ),
        Container(
          child: ListTile(
            title: Text('Your cards',
              style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.pushNamed(context, CardsScreen.routeName);
            },
          ),
          color: TripItColors.primaryDarkBlue,
        ),
        Container(
          child: ListTile(
            title: Text('Your trips',
              style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.pushNamed(context, TripScreen.routeName);
            },
          ),
          color: TripItColors.primaryDarkBlue,
        ),
        Container(
          child: ListTile(
            title: Text('About',
              style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.pushNamed(context, AboutScreen.routeName);
            },
          ),
          color: TripItColors.primaryDarkBlue,
        ),
        ListTile(
          title: Text('Test'),
          onTap: () {
            Navigator.pushNamed(context, TestScreen.routeName);
          },
        ),
      ],
    ),
    ),
  );
    throw UnimplementedError();
  }
}