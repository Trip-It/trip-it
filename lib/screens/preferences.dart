import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/add_profile.dart';
import 'package:trip_it_app/theme.dart';
import 'package:trip_it_app/widgets/dropdown.dart';
import 'package:trip_it_app/widgets/charge_slider.dart';
import 'package:trip_it_app/widgets/checkbox_options.dart';
import 'package:trip_it_app/widgets/switch_options.dart';
import 'package:trip_it_app/services/profiles_manager.dart';
import 'package:trip_it_app/models/profile.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';

/// Screen allowing the user to configure the preferences
class PreferencesScreen extends StatefulWidget {
  static const routeName = '/preferences';

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  /// Fields to store profile information
  String car;
  double minCharge;
  double maxCharge;
  int restaurant;
  int cinema;
  int sport;
  int plug; // 0 for plug and 1 for estimation
  String language;
  String mapType;

  /// For sliders
  double _chargeMin = 10;
  double _chargeMax = 80;


  /// For checkboxes
  bool _checked1 = false;
  bool _checked2 = false;
  bool _checked3 = false;

  /// For switch options
  bool _checkedSwitch = false;

  /// Fields to provide information to widgets
  List<String> _carOptions = [
    "Zoe R90 22kWh",
    "Zoe R90 41kWh",
    "Zoe R110 52kWh"
  ];
  List<String> _languageOptions = [
    "English",
    "Français",
    "Deutsch",
    "Espagnol",
  ];
  List<String> _mapTypeOptions = ["Satellite", "Normal", "Hybrid"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Preferences"),
      ),
      body: ListView(
        padding: EdgeInsets.all(12.0),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: TripItColors.primaryLightBlue,
                borderRadius: BorderRadius.circular(10)),
            padding: new EdgeInsets.all(2.0),
            child: new Column(
              children: <Widget>[
                // DropdownWidget
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Text("Choose a car"), // Not necessary for Option 1
                    value: car,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: TripItColors.primaryLightBlue,
                    ),
                    iconSize: 42,
                    underline: SizedBox(),
                    onChanged: (newValue) {
                      setState(() {
                        car = newValue;
                      });
                    },
                    items: _carOptions.map((option) {
                      return DropdownMenuItem(
                        child: new Text(option),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            decoration: BoxDecoration(
                color: TripItColors.primaryLightBlue,
                borderRadius: BorderRadius.circular(10)),
            padding: new EdgeInsets.all(2.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  // ChargeSliderWidget for MinimumCharge
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Minimum charge",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.0, top: 0.0, right: 8.0, bottom: 8.0),
                          child: FluidSlider(
                            valueTextStyle: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: TripItColors.primaryDarkBlue,
                            ),
                            value: _chargeMin,
                            onChanged: (newCharge) {
                              setState(() => _chargeMin = newCharge);
                              minCharge = newCharge;
                            },
                            min: 5,
                            max: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ChargeSliderWidget for MaximumCharge
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Maximum charge",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.0, top: 0.0, right: 8.0, bottom: 8.0),
                          child: FluidSlider(
                            valueTextStyle: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: TripItColors.primaryDarkBlue,
                            ),
                            value: _chargeMax,
                            onChanged: (newCharge) {
                              setState(() => _chargeMax = newCharge);
                              maxCharge = newCharge;
                            },
                            min: 30,
                            max: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            decoration: BoxDecoration(
                color: TripItColors.primaryLightBlue,
                borderRadius: BorderRadius.circular(10)),
            padding: new EdgeInsets.all(2.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  // CheckboxOptionsWidget for Restaurant
                  CheckboxListTile(
                    value: _checked1,
                    onChanged: (value) {
                      setState(() {
                        _checked1 = value;
                        value ? restaurant = 1 : restaurant = 0;
                      });
                    },
                    title: new Text(
                      "Restaurant",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    //secondary: new Icon(Icons.archive),
                    activeColor: TripItColors.primaryLightBlue,
                  ),
                  // CheckboxOptionsWidget for Cinema
                  CheckboxListTile(
                    value: _checked2,
                    onChanged: (value) {
                      setState(() {
                        _checked2 = value;
                        value ? cinema = 1 : cinema = 0;
                      });
                    },
                    title: new Text(
                      "Cinema",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    //secondary: new Icon(Icons.archive),
                    activeColor: TripItColors.primaryLightBlue,
                  ),
                  // CheckboxOptionsWidget for Sport
                  CheckboxListTile(
                    value: _checked3,
                    onChanged: (value) {
                      setState(() {
                        _checked3 = value;
                        value ? sport = 1 : sport = 0;
                      });
                    },
                    title: new Text(
                      "Sport",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    //secondary: new Icon(Icons.archive),
                    activeColor: TripItColors.primaryLightBlue,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            decoration: BoxDecoration(
                color: TripItColors.primaryLightBlue,
                borderRadius: BorderRadius.circular(10)),
            padding: new EdgeInsets.all(2.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              // SwitchOptionsWidget for Plug/Estimation
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Plug",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    value: _checkedSwitch,
                    onChanged: (value) {
                      setState(() => _checkedSwitch = value);
                      value ? plug = 1 : plug = 0;
                    },
                    activeTrackColor: TripItColors.primaryLightBlue,
                    activeColor: TripItColors.primaryDarkBlue,
                  ),
                  Text(
                    "Estimation",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            decoration: BoxDecoration(
                color: TripItColors.primaryLightBlue,
                borderRadius: BorderRadius.circular(10)),
            padding: new EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                // DropdownWidget for language
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    isExpanded: true,
                    hint:
                        Text("Choose a language"), // Not necessary for Option 1
                    value: language,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: TripItColors.primaryLightBlue,
                    ),
                    iconSize: 42,
                    underline: SizedBox(),
                    onChanged: (newValue) {
                      setState(() {
                        language = newValue;
                      });
                    },
                    items: _languageOptions.map((option) {
                      return DropdownMenuItem(
                        child: new Text(option),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            decoration: BoxDecoration(
                color: TripItColors.primaryLightBlue,
                borderRadius: BorderRadius.circular(10)),
            padding: new EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                // DropdownWidget for MapType
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    isExpanded: true,
                    hint:
                        Text("Choose a map type"), // Not necessary for Option 1
                    value: mapType,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: TripItColors.primaryLightBlue,
                    ),
                    iconSize: 42,
                    underline: SizedBox(),
                    onChanged: (newValue) {
                      setState(() {
                        mapType = newValue;
                      });
                    },
                    items: _mapTypeOptions.map((option) {
                      return DropdownMenuItem(
                        child: new Text(option),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new RaisedButton(
                color: TripItColors.primaryLightBlue,
                child: new Text(
                  "Save to current profile",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  saveInCurrentProfile();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(
                      color: TripItColors.primaryLightBlue, width: 2.0),
                ),
              ),
              new RaisedButton(
                color: TripItColors.primaryLightBlue,
                child: new Text(
                  "New profile",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Open screen to add new profile to database
                  //TODO save data from widgets and get it to the next screen
                  Navigator.pushNamed(context, AddProfileScreen.routeName);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: TripItColors.primaryLightBlue,
                    width: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Method to save the preferences in a profile
  void saveInCurrentProfile() async {
    ProfilesManager dbManager = ProfilesManager();

    print("Save button pushed");


    //Profile toSave = new Profile("Name", "Elephant", "Tesla Model S", 40, 80, 1, 0, 1, 0, "Norwegian", "Hybrid");

    //dbManager.saveProfile(toSave);

    //List<Profile> profiles = await dbManager.getProfiles();

    //print(profiles.length.toString());
    return;
  }

  void _valueChanged1(bool value) => setState(() => _checked1 = value);
}
