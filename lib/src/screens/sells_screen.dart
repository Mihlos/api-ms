import 'package:flutter/material.dart';

import '../widgets/tab_bar.dart';
import '../widgets/tabbar_views.dart';
import '../widgets/drawer.dart';
import '../webservices.dart';
import '../styles/styles.dart';

class DataSells extends StatefulWidget {
  @override
  _DataSellsState createState() => _DataSellsState();
}

class _DataSellsState extends State<DataSells> {
  //Crear las tabs del formulario.
  @override
  void initState() {
    if (tabsSells.length == 0) {
      super.initState();
      tabBarBuilder(section: 'Sells', text:'Albaranes', icon: Icons.photo_album);
      tabBarBuilder(section: 'Sells', text:'Facturas', icon: Icons.picture_as_pdf);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsSells.length,
      child: Scaffold(
        //En Widgets/drawer
        drawer: buildDrawer(context),
        appBar: AppBar(
          title: Text('Documentos ventas', style: Styles.headerWhite),
          backgroundColor: Styles.blueMS,
          bottom: TabBar(
            tabs: tabsSells,
            unselectedLabelColor: Styles.darkMS,
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text(
                'Albaranes ventas',
                style: Styles.headerDark,
              ),
            ),
            Center(
              child: Text(
                'Facturas ventas',
                style: Styles.headerDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
