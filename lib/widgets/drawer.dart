import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/about.dart';
import 'package:trip_it_app/screens/cards.dart';
import 'package:trip_it_app/screens/preferences.dart';
import 'package:trip_it_app/screens/profiles.dart';
import 'package:trip_it_app/screens/trip.dart';
import 'package:trip_it_app/screens/new_trip.dart';
import 'package:trip_it_app/screens/test.dart';
import 'package:trip_it_app/screens/trip.dart';
import 'package:trip_it_app/screens/home.dart';
import 'package:trip_it_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:trip_it_app/models/profile.dart';

class DrawerWidget extends StatelessWidget {
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
                      Consumer<Profile>(//                  <--- Consumer
                          builder: (context, myProfile, child) {
                        return Container(
                          child: LayoutBuilder(builder: (context, constraint) {
                            return Wrap(children: <Widget>[
                              Image.asset(myProfile.getPicture(), height: constraint.biggest.height, width: constraint.biggest.height)
                            ]
                            );
                          }),
                        );
                      }),
                      Consumer<Profile>(//                  <--- Consumer
                          builder: (context, myProfile, child) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(" "+
                                myProfile.getFirstName() +" "+
                                    myProfile.getLastName(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              /*Text(
                          "London, England",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),*/
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.popUntil(context, (route){
                    (route.settings.name != ProfilesScreen.routeName) ? Navigator.popAndPushNamed(
                        context, ProfilesScreen.routeName) : Navigator.of(context)
                        .pop();
                    return true;
                  });
                },
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.map, color: Colors.white),
                title: Text(
                  'Map',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.popUntil(context, (route){
                    (route.settings.name != HomeScreen.routeName) ? Navigator.popAndPushNamed(
                        context, HomeScreen.routeName) : Navigator.of(context)
                        .pop();
                    return true;
                  });
                  },
              ),
              color: TripItColors.primaryDarkBlue,
            ),

            Container(
              child: ListTile(
                title: Text(
                  'Your preferences',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(
                      context, PreferencesScreen.routeName);
                },
              ),
              color: TripItColors.primaryDarkBlue,
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Your cards',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                onTap: () {
                  Navigator.popUntil(context, (route){
                    (route.settings.name != CardsScreen.routeName) ? Navigator.popAndPushNamed(
                        context, CardsScreen.routeName) : Navigator.of(context)
                        .pop();
                    return true;
                  });
                },
              ),
              color: TripItColors.primaryDarkBlue,
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Your trips',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                onTap: () {
                  Navigator.popUntil(context, (route){
                    (route.settings.name != TripScreen.routeName) ? Navigator.popAndPushNamed(
                        context, TripScreen.routeName) : Navigator.of(context)
                        .pop();
                    return true;
                  });
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
                  Navigator.popUntil(context, (route){
                    (route.settings.name != AboutScreen.routeName) ? Navigator.popAndPushNamed(
                        context, AboutScreen.routeName) : Navigator.of(context)
                        .pop();
                    return true;
                  });
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
