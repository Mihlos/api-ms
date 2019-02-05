import 'package:flutter/material.dart';

import '../webservices.dart';

class TabsViews extends StatefulWidget {
  @override
  _TabsViewsState createState() => _TabsViewsState();
}

class _TabsViewsState extends State<TabsViews> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: <Widget>[
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                  FetchData.fetchCustomers();
              },
              child: Text('Leer usuarios', style: TextStyle(color: Colors.white),),
              color: Colors.blueAccent,
            ),
            Card(
              child: Text('Usuarios'),
            ),
          ],
        ),
      ),
      Container(
        child: Text('articulos'),
      )
    ]);
  }
}
