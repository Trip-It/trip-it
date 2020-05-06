import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_it_app/models/profile.dart';

class TripScreen extends StatelessWidget {
  static const routeName = '/trip';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Your Trips"),
        ),
        body: Center(child: Consumer<Profile>(//                  <--- Consumer
            builder: (context, myModel, child) {
              return Text(myModel.toString());
            })));
  }
}
