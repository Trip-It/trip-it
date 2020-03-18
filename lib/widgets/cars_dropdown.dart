import 'package:flutter/material.dart';
import 'package:trip_it_app/theme.dart';

class CarsDropdownWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CarsDropdownWidgetState();
}

class _CarsDropdownWidgetState extends State<CarsDropdownWidget> {
  List<String> _cars = ['Zoe R90 22kWh', 'Zoe R90 41kWh', 'Zoe R110 52kWh']; //TODO dynamic fill using Database
  String _selectedCar;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButton(
            isExpanded: true,
            hint: Text('Choose a car'), // Not necessary for Option 1
            value: _selectedCar,
            icon: Icon(
                Icons.keyboard_arrow_down,
                color: TripItColors.primaryLightBlue,
            ),
            iconSize: 42,
            underline: SizedBox(),
            onChanged: (newValue) {
              setState(() {
                _selectedCar = newValue;
              });
            },
            items: _cars.map((car) {
              return DropdownMenuItem(
                child: new Text(car),
                value: car,
              );
            }).toList(),
          ),
    );
  }
}