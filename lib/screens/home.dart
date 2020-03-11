import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/searchbar.dart';
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
        body: Stack(
          children: <Widget>[
            Container(
              child: MapView(),
            ),
            Positioned(
              bottom: 10,
              right: 15,
              left: 15,
              child: SearchBar(),
            )
          ],
          ),

        //body: Center(
          //child: MapView(),
        );
  }
}