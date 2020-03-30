import 'package:flutter/material.dart';
import 'package:trip_it_app/widgets/aboutListView.dart';

class AddProfileScreen extends StatelessWidget {
  static const routeName = '/preferences/add';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Add Profile"),
          centerTitle: true,
        ),
        body: Center(
          child: Text("Save your preferences as profile"),
        )
    );
  }
}