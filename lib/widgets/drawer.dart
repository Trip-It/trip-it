import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/about.dart';
import 'package:trip_it_app/screens/cards.dart';
import 'package:trip_it_app/screens/obd_data.dart';
import 'package:trip_it_app/screens/preferences.dart';
import 'package:trip_it_app/screens/profiles.dart';
import 'package:trip_it_app/screens/trip.dart';
import 'package:trip_it_app/screens/test.dart';
import 'package:trip_it_app/theme.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:trip_it_app/screens/ObdConnectionScreen.dart';




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
          decoration: BoxDecoration(
            color: TripItColors.primaryDarkBlue,
          ),
          child: GestureDetector(
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: TripItColors.primaryDarkBlue,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    child: LayoutBuilder(builder: (context, constraint) {
                      return Icon(
                        Icons.account_circle,
                        size: constraint.biggest.height,
                        color: Colors.white,
                      );
                    }),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Ford Prefect",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "London, England",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, ProfilesScreen.routeName);
            },
          ),
        ),
        Container(
          child: ListTile(
            title: Text(
              'New trip',
            style: TextStyle(
                color: Colors.white,
              fontSize: 16.0,
            ),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, TripScreen.routeName);
            },
          ),
          color: TripItColors.primaryDarkBlue,
        ),
        Container(
          child: ListTile(
            title: Text('Your preferences',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, PreferencesScreen.routeName);
            },
          ),
          color: TripItColors.primaryDarkBlue,
        ),
        Container(
          child: ListTile(
            title: Text('Your cards',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, CardsScreen.routeName);
            },
          ),
          color: TripItColors.primaryDarkBlue,
        ),
        Container(
          child: ListTile(
            title: Text('Your trips',
              style: TextStyle(
                  color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, TripScreen.routeName);
            },
          ),
          color: TripItColors.primaryDarkBlue,
        ),
        Container(
          child: ListTile(
            title: Text(
              'OBD Data',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, ObdDataScreen.routeName);

            },
          ),
          color: TripItColors.primaryDarkBlue,
        ),
        Container(
          child: ListTile(
            title: Text(
              'About',
              style: TextStyle(
                  color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, AboutScreen.routeName);
            },
          ),
          color: TripItColors.primaryDarkBlue,
        ),
        /*
        ListTile(
          title: Text('Test'),
          onTap: () {
            Navigator.pushNamed(context, TestScreen.routeName);
          },
        ),
        */
      ],
    ),
    ),
  );
    throw UnimplementedError();
  }
}