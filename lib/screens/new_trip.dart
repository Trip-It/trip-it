import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_it_app/models/profile.dart';

class NewTripScreen extends StatelessWidget {
  static const routeName = '/newtrip';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Trip"),
        ),
        body: Center(child: Consumer<Profile>(//                  <--- Consumer
            builder: (context, myProfile, child) {
              return RaisedButton(
                child: Text('Do something'),
                onPressed: (){
                  myProfile.setCinema(1);
                },
              );
            })));
  }

}