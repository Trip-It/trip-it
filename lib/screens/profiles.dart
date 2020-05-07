import 'package:flutter/material.dart';
import 'package:trip_it_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:trip_it_app/services/profiles_manager.dart';
import 'package:trip_it_app/models/profile.dart';

class ProfilesScreen extends StatefulWidget {
  static const routeName = '/profiles';

  State<StatefulWidget> createState() => _ProfilesScreen();
}

class _ProfilesScreen extends State<ProfilesScreen> {
  List<Profile> profiles = new List();

  _ProfilesScreen() {
    initProfilesList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: TripItColors.primaryDarkBlue,
          centerTitle: true,
          title: Text("Profiles"),
        ),
        body: Consumer<Profile>(//                  <--- Consumer
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
                    return new GestureDetector(
                        child: new Card(
                          elevation: 5.0,
                          color: tripitThemeData.accentColor,
                          child: Wrap(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: new Image.asset(profiles[index].getPicture(), width: 130 ,height: 130),

                              ),
                              Container(
                                alignment: Alignment.center,
                                child: new Text(profiles[index].getFirstName(),
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
                        onLongPress: (){

                        },
                        onTap: () {
                          setState(() {
                            myProfile.setPicture(profiles[index].getPicture());
                            myProfile.setId(profiles[index].getId());
                            myProfile.setLastName(profiles[index].getLastName());
                            myProfile.setFirstName(profiles[index].getFirstName());
                            myProfile.setMapType(profiles[index].getMapType());
                            myProfile.setCar(profiles[index].getCar());
                            myProfile.setMinimumCharge(profiles[index].getMinimumCharge());
                            myProfile.setMaximumCharge(profiles[index].getMaximumCharge());
                            myProfile.setRestaurant(profiles[index].getRestaurant());
                            myProfile.setCinema(profiles[index].getCinema());
                            myProfile.setSport(profiles[index].getSport());
                            myProfile.setPlug(profiles[index].getPlug());
                            myProfile.setLanguage(profiles[index].getLanguage());
                          });
                        });
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
}
