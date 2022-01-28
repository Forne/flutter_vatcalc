import 'package:flutter/material.dart';

ThemeData themeLight() => ThemeData(
    splashColor: Colors.teal,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
      primarySwatch: Colors.teal,
    ).copyWith(
      secondary: Colors.teal,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline4: TextStyle(fontSize: 30.0, color: Colors.black87),
      headline6: TextStyle(fontSize: 24.0, color: Colors.black87),
      bodyText2:
          TextStyle(fontSize: 16.0, fontFamily: 'Hind', color: Colors.black87),
    ),
    drawerTheme: DrawerThemeData(backgroundColor: Colors.teal.shade50),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.teal,
      centerTitle: false,
      elevation: 15,
    ));
