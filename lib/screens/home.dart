import 'package:flutter/material.dart';

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
        )
    );
  }
}