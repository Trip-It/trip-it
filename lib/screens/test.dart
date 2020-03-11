import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_it_app/widgets/drawer.dart';
import 'package:trip_it_app/screens/loader.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// TestScreen to test the [loader] implementation
class TestScreen extends StatelessWidget {
  static const routeName = '/test';
  static const url = 'https://flutter.dev/';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_TestLoading>(
        create: (_) => _TestLoading(),
        child: Scaffold(
          appBar: new AppBar(
            title: Text("Test it!"),
          ),
          drawer: DrawerWidget(),
          body: Consumer<_TestLoading>(
            builder: (_, model, child) => Container(
              child: Stack(
                children: <Widget>[
                  new WebView(
                    initialUrl: url,
                    onPageFinished: (_) async {
                      model.setIsLoading(false);
                    },
                  ),
                  model.isLoading ? Center(child: Loader()) : Container(),
                ],
              ),
            ),
          ),
        ));
  }
}

class _TestLoading extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
