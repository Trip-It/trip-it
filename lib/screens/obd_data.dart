import 'package:flutter/material.dart';
import 'package:trip_it_app/services/connection_manager.dart';
import 'package:trip_it_app/screens/ObdConnectionScreen.dart';

class ObdDataScreen extends StatelessWidget {
  static const routeName = '/obd_data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Read OBD Data"),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Retrieved Data'),
        ),
        floatingActionButton: FloatingActionButton(

          child: const Icon(Icons.bluetooth),
          onPressed: () {
            Navigator.pushNamed(context, ObdConnectionScreen.routeName);
          },
    )
    )
    ;
  }
}
