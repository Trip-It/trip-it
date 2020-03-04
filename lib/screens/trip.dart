import 'package:flutter/material.dart';

class TripScreen extends StatelessWidget {
  static const routeName = '/trip';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Trip"),
        ),
        body: Center(
          child: Text("New trip and so on..."),
        )
    );
  }
}