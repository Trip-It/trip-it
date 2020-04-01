import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/searchbar.dart';
import 'package:trip_it_app/widgets/drawer.dart';
import 'package:trip_it_app/widgets/map.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("Trip it!"),
        ),
        drawer: DrawerWidget(),
        body: Stack(
          children: <Widget>[
            Container(
              child: MapView(false,SearchBar.newPos),
            ),
            Positioned(
              bottom: 10,
              right: 50,
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