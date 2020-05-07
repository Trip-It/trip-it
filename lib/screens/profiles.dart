import 'package:flutter/material.dart';
import 'package:trip_it_app/theme.dart';

class ProfilesScreen extends StatelessWidget {
  static const routeName = '/profiles';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: TripItColors.primaryDarkBlue,
          centerTitle: true,
          title: Text("Profiles"),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: TripItColors.primaryDarkBlue,
          ),
          child: Center(
            child: Text(
              "Profile, profile, profile",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
    );
  }
}