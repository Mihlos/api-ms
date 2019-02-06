import 'package:flutter/material.dart';

import 'models/people_model.dart';
import 'models/item_model.dart';
import 'webservices.dart';

class DataApp extends StatefulWidget {
  @override
  _DataAppState createState() => _DataAppState();
}

class _DataAppState extends State<DataApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Consumo API Manchasoft'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.supervised_user_circle),
              text: 'Personas',
            ),
            Tab(
              icon: Icon(Icons.layers),
              text: 'Artículos',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            //Usuarios
            FutureBuilder<People>(
              future: getPeople(),
              builder: (BuildContext context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.hasError){
                    return ErrorWidget(snapshot.error.toString());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data == null ? 0 : snapshot.data.persona.length,
                    itemBuilder: (BuildContext context, int index ){
                      return Card(
                        child: peopleBuilder(snapshot.data.persona[index]),
                      );
                    },);
                }
                else
                  return Center(child: CircularProgressIndicator());
              },
            ),
            //Articulos
            FutureBuilder<Items>(
              future: getItem(),
              builder: (BuildContext context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.hasError){
                    return ErrorWidget(snapshot.error.toString());
                  }
                  return ListView.builder(
                      itemCount: snapshot.data == null ? 0 : snapshot.data.articulo.length,
                      itemBuilder: (BuildContext context, int index ){
                        return Card(
                          child: itemBuilder(snapshot.data.articulo[index]),
                        );
                      },);
                }
                else
                  return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget peopleBuilder(Persona person) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        person.name,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget itemBuilder(Articulo articulo) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        articulo.name,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
