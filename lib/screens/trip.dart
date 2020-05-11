import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_it_app/models/profile.dart';
import 'package:trip_it_app/widgets/drawer.dart';

class TripScreen extends StatelessWidget {
  static const routeName = '/trip';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Your Trips"),
        ),
        drawer: DrawerWidget(),
        body: Center(child: Consumer<Profile>(//                  <--- Consumer
            builder: (context, myModel, child) {
          return Text(myModel.toString());
        })));
  }
}
