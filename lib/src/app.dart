import 'package:flutter/material.dart';

import 'widgets/tab_bar.dart';
import 'widgets/tabbar_views.dart';

class DataApp extends StatefulWidget {
  @override
  _DataAppState createState() => _DataAppState();
}

class _DataAppState extends State<DataApp> {
  //Crear las tabs del formulario.
  @override
  void initState() {
    super.initState();
    tabBarBuilder(text: 'Personas', icon: Icons.supervised_user_circle);
    tabBarBuilder(text: 'Artículos', icon: Icons.layers);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsMasters.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Consumo API Manchasoft'),
          bottom: TabBar(tabs: tabsMasters),
        ),
        body: buildTabBarView(),
      ),
    );
  }
}
