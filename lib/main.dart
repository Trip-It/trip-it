import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/about.dart';
import 'package:trip_it_app/screens/cards.dart';
import 'package:trip_it_app/screens/home.dart';
import 'package:trip_it_app/screens/preferences.dart';
import 'package:trip_it_app/screens/profiles.dart';
import 'package:trip_it_app/screens/trip.dart';
import 'package:trip_it_app/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: tripitThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        ProfilesScreen.routeName: (context) => ProfilesScreen(),
        TripScreen.routeName: (context) => TripScreen(),
        PreferencesScreen.routeName: (context) => PreferencesScreen(),
        CardsScreen.routeName: (context) => CardsScreen(),
        AboutScreen.routeName: (context) => AboutScreen(),
      },
    );
  }
}
