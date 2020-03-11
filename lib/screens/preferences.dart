import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
  static const routeName = '/preferences';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Preferences"),
        ),
        body: Center(
          child: Text("These are your preferences"),
        )
    );
  }
}