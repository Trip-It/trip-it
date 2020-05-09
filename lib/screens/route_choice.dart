import 'package:flutter/material.dart';

class RouteChoiceScreen extends StatefulWidget {
  static const routeName = '/routechoice';

  State<StatefulWidget> createState() => _RouteChoiceScreenState();
}
class _RouteChoiceScreenState extends State<RouteChoiceScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Choose your trip"),
        ),
        body: Center(
          child: Text("Please choose your trip"),
        ));
  }

}