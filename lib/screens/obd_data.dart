import 'package:flutter/material.dart';
import 'package:trip_it_app/services/bluetooth_handler.dart';

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
        onPressed: () => 1, //retrieve data from obd
          child: const Icon(Icons.add),
    )
    )
    ;
  }
}
