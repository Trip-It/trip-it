import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';

/// Widget to display an adaptive slider within an lower and upper bound
class ChargeSliderWidget extends StatefulWidget {
  final double min;
  final double max;
  final double start;
  final String title;

  /// Set [min] value selectable, [max] value selectable
  const ChargeSliderWidget(this.min, this.max, this.start, this.title);

  @override
  State<StatefulWidget> createState() => _ChargeSliderWidgetState(start);
}

class _ChargeSliderWidgetState extends State<ChargeSliderWidget> {
  double _charge;

  _ChargeSliderWidgetState(this._charge);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child:           Text(
              widget.title,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8.0, top: 0.0, right: 8.0, bottom: 8.0),
            child: FluidSlider(
              value: _charge,
              onChanged: (newCharge) {
                setState(() => _charge = newCharge);
              },
              min: widget.min,
              max: widget.max,
            ),
          ),
        ],
      ),


    );
  }
}