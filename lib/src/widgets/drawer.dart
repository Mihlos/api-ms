import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../screens/masters_screen.dart';
import '../screens/sells_screen.dart';

Drawer buildDrawer(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(color: Styles.darkMS),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/logoM-blanco.png',
                height: 100.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text('Usuario: Antonio', style: Styles.defaultWhite)
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        ListTile(
          leading: Icon(Icons.domain, color: Styles.blueMS),
          title: Text('Maestros', style: Styles.defaultDark),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DataMasters(),
                ));
          },
        ),
        ListTile(
          leading: Icon(Icons.chrome_reader_mode, color: Styles.blueMS),
          title: Text('Ventas', style: Styles.defaultDark),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DataSells(),
                ));
          },
        ),
      ],
    ),
  );
}
