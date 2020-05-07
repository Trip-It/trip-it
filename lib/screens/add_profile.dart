import 'package:flutter/material.dart';
import 'package:trip_it_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:trip_it_app/services/profiles_manager.dart';
import 'package:trip_it_app/models/profile.dart';
import 'package:flutter/cupertino.dart';

class AddProfileScreen extends StatefulWidget {
  static const routeName = '/preferences/add';


  AddProfileScreen();

  State<StatefulWidget> createState() => _AddProfileScreen();
}
class _AddProfileScreen extends State<AddProfileScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  int selectitem = 1;
  String image = "assets/Wolf_profile.png";
  List<String> listOfPictures = ["assets/Wolf_profile.png","assets/Bear.png","assets/Bird.png",
    "assets/Dolphin.png","assets/Elephant.png","assets/Fish.png","assets/Fox.png","assets/Penguin.png",
    "assets/Rabbit.png","assets/Rhinoceros.png","assets/Tiger.png","assets/Toucan.png","assets/Turtle.png" ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
                                    title: Text(
                                      "Avatar Picker",
                                      textAlign: TextAlign.justify,
                                    ),
                                    backgroundColor:
                                        tripitThemeData.accentColor,
                                    actions: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.send),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            image = listOfPictures[selectitem];
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                  body: Container(
                                    child: CupertinoPicker(
                                      magnification: 1.5,
                                      backgroundColor: Colors.black87,
                                      children: <Widget>[
                                        Center(
                                            child: Image.asset(
                                                "assets/Wolf_profile.png")),
                                        Center(
                                            child:
                                                Image.asset("assets/Bear.png")),
                                        Center(
                                            child:
                                                Image.asset("assets/Bird.png")),
                                        Center(
                                            child: Image.asset(
                                                "assets/Dolphin.png")),
                                        Center(
                                            child: Image.asset(
                                                "assets/Elephant.png")),
                                        Center(
                                            child:
                                                Image.asset("assets/Fish.png")),
                                        Center(
                                            child:
                                                Image.asset("assets/Fox.png")),
                                        Center(
                                            child: Image.asset(
                                                "assets/Penguin.png")),
                                        Center(
                                            child: Image.asset(
                                                "assets/Rabbit.png")),
                                        Center(
                                            child: Image.asset(
                                                "assets/Rhinoceros.png")),
                                        Center(
                                            child: Image.asset(
                                                "assets/Tiger.png")),
                                        Center(
                                            child: Image.asset(
                                                "assets/Toucan.png")),
                                        Center(
                                            child: Image.asset(
                                                "assets/Turtle.png")),
                                      ],
                                      itemExtent: 180, //height of each item
                                      looping: false,
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
                          backgroundImage: AssetImage(image),
                          child: Center(
                            child: Text('Tap to change image',
                                textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, shadows: [
                                Shadow( // bottomLeft
                                    offset: Offset(-1.5, -1.5),
                                    color: Colors.black
                                ),
                                Shadow( // bottomRight
                                    offset: Offset(1.5, -1.5),
                                    color: Colors.black
                                ),
                                Shadow( // topRight
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black
                                ),
                                Shadow( // topLeft
                                    offset: Offset(-1.5, 1.5),
                                    color: Colors.black
                                ),
                              ])),
                          )),
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
                          if (firstNameController.text.isEmpty||lastNameController.text.isEmpty){
                            showSnackBar(false);
                          }
                          else{
                          myProfile.setFirstName(firstNameController.text);
                          myProfile.setLastName(lastNameController.text);
                          myProfile.setPicture(image);
                          myProfile.setId(firstNameController.text +
                              lastNameController.text);
                          saveInNewProfile(myProfile);
                          showSnackBar(true);
                          }
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
  void showSnackBar(bool success) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: success ? Colors.green : Colors.red, // Set color depending on success
        content: success? const Text(
          'Your new profile has been saved',
          style: TextStyle(color: Colors.white),
        )
            :const Text(
          'Your profile is not complete, you can not save it',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
