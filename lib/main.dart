import 'package:flutter/material.dart';
import 'package:vatcalc/about_screen.dart';
import 'package:vatcalc/calculator_screen.dart';
import 'package:vatcalc/help_screen.dart';
import 'package:vatcalc/history_screen.dart';
import 'package:vatcalc/utils/theme.dart';
import 'package:vatcalc/utils/theme_dark.dart';

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
      theme: themeLight(),
      darkTheme: themeDark(),
      themeMode: ThemeMode.system,
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
