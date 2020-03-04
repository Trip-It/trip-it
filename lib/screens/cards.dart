import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  static const routeName = '/cards';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Cards"),
        ),
        body: Center(
          child: Text("Playing cards"),
        )
    );
  }
}