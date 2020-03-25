import 'package:flutter/material.dart';
import 'package:trip_it_app/widgets/drawer.dart';
import 'package:trip_it_app/widgets/map.dart';
import 'package:trip_it_app/models/location.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
 @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("Trip it!"),
        ),
        drawer: DrawerWidget(),
        body: Center(
          child: MapView(),
        ),
    );
  }
}