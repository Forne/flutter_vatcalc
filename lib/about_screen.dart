import 'package:flutter/material.dart';

import 'drawer_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О приложении'),
      ),
      drawer: navDrawer(context),
      body: const Center(
        child: Text("Разработано Forne. 2022"),
      ),
    );
  }
}
