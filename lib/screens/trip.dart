import 'package:flutter/material.dart';
import 'package:trip_it_app/widgets/drawer.dart';

class TripScreen extends StatelessWidget {
  static const routeName = '/trip';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Trip"),
        ),
        drawer: DrawerWidget(),
        body: Center(
          child: Text("New trip and so on..."),
        )
    );
  }
}