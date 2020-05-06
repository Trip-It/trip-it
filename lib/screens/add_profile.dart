import 'package:flutter/material.dart';
import 'package:trip_it_app/theme.dart';
import 'package:file/file.dart';

class AddProfileScreen extends StatelessWidget {
  static const routeName = '/preferences/add';

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
        body: Center(
          child: Column(
            //This Columns widget will contain 5 Container widgets for the picture,
            //the text, the two texts fields and the save button
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Container for the picture
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Center(
                  child: new RawMaterialButton(
                    onPressed: (
                        //TODO implement the choice of the avatar
                        ) {},
                    child: new CircleAvatar(
                      radius: (MediaQuery.of(context).size.width / 5.0),
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/avatars/dolphin_blue.png'), //FIXME to fit the user's choice
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                  ),
                ),
              ),
              //Container for the Text 'Tap to change image'
              Container(
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Center(
                  child: Text('Tap to change image',textAlign: TextAlign.center)
                )
              ),
              //Container for the TextField 'First name'
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First name',
                    ),
                  )
              ),
              //Container for the TextField 'Last name'
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last name',
                  ),
                ),
              ),
              //Container for the save button
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                height: 200,
                child: Center(
                  child: ButtonTheme(
                    minWidth: 175.0,
                    height: 60.0,
                    child: RaisedButton(
                      color: TripItColors.primaryLightBlue,
                      child: new Text(
                        "Save profile",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      ),
                      onPressed: () {
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
        )
    );
  }
}