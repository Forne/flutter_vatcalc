import 'package:flutter/material.dart';

Widget navDrawer(context) => Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: const Icon(
                        Icons.calculate,
                        size: 100,
                      ),
                    ),
                    const Text("Калькулятор НДС"),
                  ],
                ),
              )),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text("Калькулятор"),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("История расчетов"),
            onTap: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
          const Divider(),
          /*ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Справка"),
            onTap: () {
              Navigator.pushNamed(context, '/help');
            },
          ),*/
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("О приложении"),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
