import 'package:flutter/material.dart';
import 'package:trip_it_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:trip_it_app/services/profiles_manager.dart';
import 'package:trip_it_app/models/profile.dart';
import 'package:flutter/cupertino.dart';

class AddProfileScreen extends StatelessWidget {
  static const routeName = '/preferences/add';
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  int selectitem = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Add Profile"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Consumer<Profile>(//                  <--- Consumer
            builder: (context, myProfile, child) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Center(
                    child: new RawMaterialButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext builder) {
                              return Scaffold(
                                  appBar: AppBar(
                                    centerTitle: true,
                                    title: Text(
                                      "Avatar Picker",
                                      textAlign: TextAlign.justify,
                                    ),
                                    backgroundColor: tripitThemeData.accentColor,
                                    actions: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.send),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                  body: Container(
                                    child: CupertinoPicker(
                                      magnification: 1.5,
                                      backgroundColor: Colors.black87,
                                      children: <Widget>[
                                        Image.asset("assets/Wolf_profile.png"
                                        ),
                                        Image.asset("assets/Bear.png"
                                        ),
                                        Image.asset("assets/Bird.png"
                                        ),
                                        Image.asset("assets/Dolphin.png"
                                        ),
                                        Image.asset("assets/Elephant.png"
                                        ),
                                        Image.asset("assets/Fish.png"
                                        ),
                                        Image.asset("assets/Fox.png"
                                        ),
                                        Image.asset("assets/Penguin.png"
                                        ),
                                        Image.asset("assets/Rabbit.png"
                                        ),
                                        Image.asset("assets/Rhinoceros.png"
                                        ),
                                        Image.asset("assets/Tiger.png"
                                        ),
                                        Image.asset("assets/Toucan.png"
                                        ),
                                        Image.asset("assets/Turtle.png"
                                        ),
                                      ],
                                      itemExtent: 160, //height of each item
                                      looping: true,
                                      onSelectedItemChanged: (int index) {
                                        selectitem = index;
                                      },
                                    ),
                                  ));
                            });
                      },
                      child: new CircleAvatar(
                        radius: (MediaQuery.of(context).size.width / 5.0),
                        backgroundColor: TripItColors.primaryDarkBlue,
                        child: Center(
                          child: Text('Tap to change image',textAlign: TextAlign.center),)
                      ),
                      shape: new CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                    ),
                  ),
                ),
                Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First name',
                      ),
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last name',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                  //height: 200,
                  child: Center(
                    child: ButtonTheme(
                      minWidth: 175.0,
                      height: 60.0,
                      child: RaisedButton(
                        color: TripItColors.primaryLightBlue,
                        child: new Text(
                          "Save profile",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        onPressed: () {
                          myProfile.setFirstName(firstNameController.text);
                          myProfile.setLastName(lastNameController.text);
                          myProfile.setId(firstNameController.text+lastNameController.text);
                          saveInNewProfile(myProfile);
                          //TODO save data from widgets and get it to the database
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: TripItColors.primaryLightBlue,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }

  void saveInNewProfile(myProfile) async {
    ProfilesManager dbManager = ProfilesManager();
    Profile toSave = myProfile;
    dbManager.saveProfile(toSave);
    return;
  }
}
