import 'package:flutter/material.dart';
import 'package:trip_it_app/widgets/map.dart';
import 'package:trip_it_app/models/location.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("Trip it!"),
        ),
        body: Center(
          child: MapView(),
        )
    );
  }
}