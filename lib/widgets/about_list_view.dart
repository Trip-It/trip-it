import 'package:flutter/material.dart';
import 'package:trip_it_app/screens/about.dart';
import 'package:trip_it_app/screens/cards.dart';
import 'package:trip_it_app/screens/preferences.dart';
import 'package:trip_it_app/screens/profiles.dart';
import 'package:trip_it_app/screens/trip.dart';
import 'package:trip_it_app/theme.dart';

class AboutWidget extends StatelessWidget {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    final titles = [
      'About us',
      'Better World Initiative',
      'Contact',
      'License'
    ];

    final icons = [
      "assets/AboutUs_logo.png",
      "assets/BWI_logo.png",
      "assets/Contact_logo.png",
      "assets/License_logo.png"
    ];

    final subtitles = [
      'Learn more about the team behind Trip It!',
      'Learn more about our values concerning your privacy',
      'Something to tell us?',
      'Apache 2.0 License',
    ];

    final descriptions = [
      'The Trip It! team is composed by 7 students from the engineering school Grenoble INP - Ense3, France.We worked all together in order to provide you the best route planner app for EVs.[Names]',
      'We are convinced that one\'s privacy must be respected, this is why your data is only stored locally on your phone. The only data which we could get is the anonymous feedback you decide to send or not after each trip. (This feedback allows us to refine the estimation calculations.)This is the aim emphasized by Better World Initiative.',
      'Don\'t hesitate to give us feedback or any suggestions concerning our application via : Mail Adress Contact Yves Maréchal ?',
      'The project is using an Aapache 2.0 License.'];

    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
             Card(
                    child: Padding(
                      padding: EdgeInsets.only(
                       top: 24.0, left: 6.0, right: 6.0, bottom: 24.0),
                          child: ExpansionTile(
                            title: Text(
                                titles[index], style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(subtitles[index], style: TextStyle(color: Colors.black.withOpacity(0.4))),
                            leading: Image.asset(icons[index], height: 100, width: 100),
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 24.0, left: 15.0, right: 15.0, bottom: 24.0),
                                 child: Text(descriptions[index],style: TextStyle(color: Colors.black.withOpacity(0.4)),textAlign: TextAlign.justify),
                              )
                            ]),
                ),
              ),
          ],
        );
      },
    );
  }
}
