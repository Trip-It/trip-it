import 'package:flutter/material.dart';
import 'package:trip_it_app/widgets/about_list_view.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("About"),
        ),
        body: Center(
          child: AboutWidget(),
        )
    );
  }
}