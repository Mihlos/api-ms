import 'package:flutter/material.dart';
import 'widgets/tabbar_views.dart';

class App extends StatelessWidget {

  final List<Tab> myTabs = [
    Tab(
      icon: Icon(Icons.account_circle),
      text: 'Clientes',
    ),
    Tab(
      icon: Icon(Icons.layers),
      text: 'Artículos',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: TabBar(
            labelPadding: EdgeInsets.only(top: 20.0),
            tabs: myTabs,
            labelColor: Colors.blueAccent,
          ),
          body: TabsViews()
        ),
      ),
    );
  }
}
