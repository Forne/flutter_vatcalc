import 'package:flutter/material.dart';

import 'drawer_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('История расчетов'),
      ),
      drawer: navDrawer(context),
      body: const Center(
        child: Text("В разработке"),
      ),
    );
  }
}
