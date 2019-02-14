import 'package:flutter/material.dart';

import '../widgets/tab_bar.dart';
import '../widgets/tabbar_views.dart';
import '../widgets/drawer.dart';
import '../webservices.dart';
import '../styles/styles.dart';

class DataMasters extends StatefulWidget {
  @override
  _DataMastersState createState() => _DataMastersState();
}

class _DataMastersState extends State<DataMasters> {
  //Crear las tabs del formulario.
  @override
  void initState() {
    if (tabsMasters.length == 0) {
    super.initState();
    tabBarBuilder(section: 'Masters', text:'Personas', icon: Icons.supervised_user_circle);
    tabBarBuilder(section: 'Masters', text:'Artículos', icon: Icons.layers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsMasters.length,
      child: Scaffold(
        //En Widgets/drawer
        drawer: buildDrawer(context),
        appBar: AppBar(
          title: Text('Datos Maestros', style: Styles.headerWhite),
          backgroundColor: Styles.blueMS,
          bottom: TabBar(
            tabs: tabsMasters,
            unselectedLabelColor: Styles.darkMS,
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            //SE ENVIA LA CLASE PARA MANDAR A UN CONSTRUCTOR U OTRO Y EL METODO.
            futureBuilder('Person', getPeople()),
            futureBuilder('Article', getItem()),
          ],
        ),
      ),
    );
  }
}
