import 'package:flutter/material.dart';
import 'package:trip_it_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:trip_it_app/services/profiles_manager.dart';
import 'package:trip_it_app/models/profile.dart';
import 'package:trip_it_app/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:trip_it_app/screens/modify_profile.dart';

class ProfilesScreen extends StatefulWidget {
  static const routeName = '/profiles';

  State<StatefulWidget> createState() => _ProfilesScreen();
}

class _ProfilesScreen extends State<ProfilesScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Profile> profiles = new List();

  @override
  Widget build(BuildContext context) {
    initProfilesList();
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: TripItColors.primaryDarkBlue,
          centerTitle: true,
          title: Text("Profiles"),
        ),
        drawer: DrawerWidget(),
        body:  Consumer<Profile>(//                  <--- Consumer
            builder: (context, myProfile, child) {
          return Container(
              decoration: BoxDecoration(
                color: TripItColors.primaryDarkBlue,
              ),
              child: new GridView.builder(
                  itemCount: profiles.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return new CupertinoContextMenu(
                      child: GestureDetector(
                          child: new Card(
                            elevation: 5.0,
                            color: tripitThemeData.accentColor,
                            child: Wrap(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: new Image.asset(
                                      profiles[index].getPicture(),
                                      width: 130,
                                      height: 130),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: new Text(
                                      profiles[index].getFirstName(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: new Text(profiles[index].getLastName(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              myProfile
                                  .setPicture(profiles[index].getPicture());
                              myProfile.setId(profiles[index].getId());
                              myProfile
                                  .setLastName(profiles[index].getLastName());
                              myProfile
                                  .setFirstName(profiles[index].getFirstName());
                              myProfile
                                  .setMapType(profiles[index].getMapType());
                              myProfile.setCar(profiles[index].getCar());
                              myProfile.setMinimumCharge(
                                  profiles[index].getMinimumCharge());
                              myProfile.setMaximumCharge(
                                  profiles[index].getMaximumCharge());
                              myProfile.setRestaurant(
                                  profiles[index].getRestaurant());
                              myProfile.setCinema(profiles[index].getCinema());
                              myProfile.setSport(profiles[index].getSport());
                              myProfile.setPlug(profiles[index].getPlug());
                              myProfile
                                  .setLanguage(profiles[index].getLanguage());
                            });
                            showSnackBar(true);
                          }),
                      actions: <Widget>[
                        CupertinoContextMenuAction(
                          child: const Text('Delete'),
                          onPressed: () {
                            setState(() {
                              ProfilesManager dbManager = ProfilesManager();
                              Profile toDelete = profiles[index];
                              dbManager.deleteProfile(toDelete);
                            });
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoContextMenuAction(
                          child: const Text('Modify'),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              myProfile
                                  .setPicture(profiles[index].getPicture());
                              myProfile.setId(profiles[index].getId());
                              myProfile
                                  .setLastName(profiles[index].getLastName());
                              myProfile
                                  .setFirstName(profiles[index].getFirstName());
                              myProfile
                                  .setMapType(profiles[index].getMapType());
                              myProfile.setCar(profiles[index].getCar());
                              myProfile.setMinimumCharge(
                                  profiles[index].getMinimumCharge());
                              myProfile.setMaximumCharge(
                                  profiles[index].getMaximumCharge());
                              myProfile.setRestaurant(
                                  profiles[index].getRestaurant());
                              myProfile.setCinema(profiles[index].getCinema());
                              myProfile.setSport(profiles[index].getSport());
                              myProfile.setPlug(profiles[index].getPlug());
                              myProfile
                                  .setLanguage(profiles[index].getLanguage());
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ModifyProfileScreen(myProfile.getId(),myProfile.getFirstName(),myProfile.getLastName(), myProfile.getPicture(),),
                            ));
                          },
                        ),
                      ],
                    );
                  }));
        }));
  }

  void initProfilesList() async {
    ProfilesManager dbManager = ProfilesManager();
    List<Profile> allProfiles = await dbManager.getProfiles();
    setState(() {
      if (allProfiles != null || allProfiles.isEmpty) {
        profiles = allProfiles;
      }
    });
  }
  void showSnackBar(bool success) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
          backgroundColor: (success)? Colors.green : Colors.red, // Set color depending on success
          content: (success)? Text("You've successfully changed profile", style: TextStyle(color: Colors.white),)
              :Text("An error occured", style: TextStyle(color: Colors.white),)
      ),
    );
  }
}