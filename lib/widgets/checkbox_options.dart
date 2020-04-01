import 'package:flutter/material.dart';
import 'package:trip_it_app/theme.dart';

class CheckboxOptionsWidget extends StatefulWidget {
  final String title;

  CheckboxOptionsWidget(this.title);

  @override
  State<StatefulWidget> createState() => new _CheckboxOptionsWidgetState();
}

//State is information of the application that can change over time or when some actions are taken.
class _CheckboxOptionsWidgetState extends State<CheckboxOptionsWidget> {
  bool _checked = false;

  void _valueChanged(bool value) => setState(() => _checked = value);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _checked,
      onChanged: _valueChanged,
      title: new Text(
        widget.title,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      //secondary: new Icon(Icons.archive),
      activeColor: TripItColors.primaryLightBlue,
    );
  }
}
