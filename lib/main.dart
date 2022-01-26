import 'package:flutter/material.dart';
import 'package:vatcalc/about_screen.dart';
import 'package:vatcalc/calculator_screen.dart';
import 'package:vatcalc/help_screen.dart';
import 'package:vatcalc/history_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CalculatorScreen(),
        '/history': (context) => const HistoryScreen(),
        '/help': (context) => const HelpScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
