import 'package:flutter/material.dart';
import 'package:trip_it_app/theme.dart';

class SwitchOptionsWidget extends StatefulWidget {
  final String option1;
  final String option2;

  SwitchOptionsWidget(this.option1, this.option2);

  @override
  State<StatefulWidget> createState() => new _SwitchOptionsWidgetState();
}

class _SwitchOptionsWidgetState extends State<SwitchOptionsWidget> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          widget.option1,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Switch(
          value: _checked,
          onChanged: (value) {
            setState(() => _checked = value);
          },
          activeTrackColor: TripItColors.primaryLightBlue,
          activeColor: TripItColors.primaryDarkBlue,
        ),
        Text(
          widget.option2,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
