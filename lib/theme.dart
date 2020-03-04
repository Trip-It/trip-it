import 'package:flutter/material.dart';

///
/// ThemeData defining the theme used throughout the app
///

final ThemeData tripitThemeData = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: Color.fromRGBO(32, 158, 187, 1.0),
  accentColor: Color.fromRGBO(2, 48, 71, 1.0),

  // Define the default font family.
  fontFamily: 'Roboto',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    body1: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
  ),
);
