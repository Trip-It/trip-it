import 'package:flutter/material.dart';
import 'package:trip_it_app/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Trip it!"),
        ),
        body: Center(
          child: Text("Welcome Home"),
        ),
        drawer: DrawerWidget()
    );
  }
}