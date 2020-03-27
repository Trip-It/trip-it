import 'package:flutter/material.dart';

class AddCardScreen extends StatelessWidget {
  static const routeName = '/addCard';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Add Card"),
        ),
        body: Center(
          child: Text("That's how you add a card"),
        )
    );
  }
}