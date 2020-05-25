import 'package:flutter/material.dart';
import 'package:trip_it_app/models/profile.dart';
import 'package:trip_it_app/screens/about.dart';
import 'package:trip_it_app/screens/add_profile.dart';
import 'package:trip_it_app/screens/add_card.dart';
import 'package:trip_it_app/screens/cards.dart';
import 'package:trip_it_app/screens/home.dart';
import 'package:trip_it_app/screens/modify_profile.dart';
import 'package:trip_it_app/screens/new_trip.dart';
import 'package:trip_it_app/screens/preferences.dart';
import 'package:trip_it_app/screens/profiles.dart';
import 'package:trip_it_app/screens/route_choice.dart';
import 'package:trip_it_app/screens/test.dart';
import 'package:provider/provider.dart';
import 'package:trip_it_app/screens/trip.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Profile>(
      //      <--- ChangeNotifierProvider
      create: (context) => Profile(
          "FordPrefect",
          "Ford",
          "Prefect",
          "assets/Wolf_profile.png",
          "Zoe R110 52kWh",
          15,
          90,
          1,
          0,
          1,
          0,
          "English",
          "Hybrid"),
      child: Consumer<Profile>(//                  <--- Consumer
        builder: (context, myProfile, child) {
        return MaterialApp(
          title: 'Trip It!',
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
            AddCardScreen.routeName: (context) => AddCardScreen(),
            ModifyProfileScreen.routeName: (context) => ModifyProfileScreen(myProfile.getId(), myProfile.getFirstName(), myProfile.getLastName(), myProfile.getPicture()),
          },
        )
        ;
      }));
  }
}
