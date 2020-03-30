import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/about.dart';
import 'package:trip_it_app/screens/addProfile.dart';
import 'package:trip_it_app/screens/cards.dart';
import 'package:trip_it_app/screens/home.dart';
import 'package:trip_it_app/screens/preferences.dart';
import 'package:trip_it_app/screens/profiles.dart';
import 'package:trip_it_app/screens/trip.dart';
import 'package:trip_it_app/screens/test.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: Color.fromRGBO(32, 158, 187, 1.0),
      accentColor: Color.fromRGBO(2, 48, 71, 1.0),

      // Define the default font family.
      fontFamily: 'Roboto',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
            
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        ProfilesScreen.routeName: (context) => ProfilesScreen(),
        TripScreen.routeName: (context) => TripScreen(),
        PreferencesScreen.routeName: (context) => PreferencesScreen(),
        AddProfileScreen.routeName: (context) => AddProfileScreen(),
        CardsScreen.routeName: (context) => CardsScreen(),
        AboutScreen.routeName: (context) => AboutScreen(),
        TestScreen.routeName: (context) => TestScreen(),
      },
    );
  }
}
