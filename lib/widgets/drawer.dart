import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/about.dart';
import 'package:trip_it_app/screens/cards.dart';
import 'package:trip_it_app/screens/preferences.dart';
import 'package:trip_it_app/screens/profiles.dart';
import 'package:trip_it_app/screens/trip.dart';

class DrawerWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        ListTile(
          //Empty space
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Your profile'),
          onTap: () {
            Navigator.pushNamed(context, ProfilesScreen.routeName);
          },
        ),
        ListTile(
          title: Text('New trip'),
          onTap: () {
            Navigator.pushNamed(context, TripScreen.routeName);
          },
        ),
        ListTile(
          title: Text('Your preferences'),
          onTap: () {
            Navigator.pushNamed(context, PreferencesScreen.routeName);
          },
        ),
        ListTile(
          title: Text('Your cards'),
          onTap: () {
            Navigator.pushNamed(context, CardsScreen.routeName);
          },
        ),
        ListTile(
          title: Text('Your trips'),
          onTap: () {
            Navigator.pushNamed(context, TripScreen.routeName);
          },
        ),
        ListTile(
          title: Text('About'),
          onTap: () {
            Navigator.pushNamed(context, AboutScreen.routeName);
          },
        ),
      ],
    ),
  );
    throw UnimplementedError();
  }
}