import 'package:flutter/material.dart';
import 'package:trip_it_app/widgets/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// TestScreen to test the [loader] implementation
class TestScreen extends StatelessWidget {
  static const routeName = '/test';
  static const url = 'https://flutter.dev/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test it!"),
        ),
        drawer: DrawerWidget(),
        body: Container(
          child: WebView(
            initialUrl: url,
            // Uncomment this to tell him what to do after finishing loading the page (i.e. making the loading screen disappear)
            //onPageFinished: ,
          ),
        ),
    );
  }

}