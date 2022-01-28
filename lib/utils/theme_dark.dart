import 'package:flutter/material.dart';

ThemeData themeDark() => ThemeData(
    splashColor: Colors.green,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF222b2e),
      primarySwatch: Colors.green,
    ).copyWith(
      secondary: Colors.green,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline4: TextStyle(fontSize: 30.0, color: Colors.white70),
      headline6: TextStyle(fontSize: 24.0, color: Colors.white70),
      bodyText2:
          TextStyle(fontSize: 16.0, fontFamily: 'Hind', color: Colors.white70),
    ),
    //drawerTheme: DrawerThemeData(backgroundColor: Colors.green.shade50),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      centerTitle: false,
      elevation: 15,
    ));
