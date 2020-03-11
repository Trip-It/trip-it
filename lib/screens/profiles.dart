import 'package:flutter/material.dart';

class ProfilesScreen extends StatelessWidget {
  static const routeName = '/profiles';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Profiles"),
        ),
        body: Center(
          child: Text("Profile, profile, profile"),
        )
    );
  }
}