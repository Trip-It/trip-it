import 'package:flutter/material.dart';
import 'package:trip_it_app/theme.dart';

class DropdownWidget extends StatefulWidget {
  final String hint;
  final List<String> options;

  DropdownWidget(this.hint, this.options);

  @override
  State<StatefulWidget> createState() => _DropdownWidgetState(options);
}

class _DropdownWidgetState extends State<DropdownWidget> {
  List<String> _options;
  String _selectedOption;

  _DropdownWidgetState(this._options);

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButton(
            isExpanded: true,
            hint: Text(widget.hint), // Not necessary for Option 1
            value: _selectedOption,
            icon: Icon(
                Icons.keyboard_arrow_down,
                color: TripItColors.primaryLightBlue,
            ),
            iconSize: 42,
            underline: SizedBox(),
            onChanged: (newValue) {
              setState(() {
                _selectedOption = newValue;
              });
            },
            items: _options.map((option) {
              return DropdownMenuItem(
                child: new Text(option),
                value: option,
              );
            }).toList(),
          ),
    );
  }
}