import 'package:flutter/material.dart';

import '../models/people_model.dart';
import '../models/item_model.dart';
import '../webservices.dart';

TabBarView buildTabBarView() {
  return TabBarView(
    children: [
      futureBuilderPeople(),
      futureBuilderItems(),
    ],
  );
}

//Personas
FutureBuilder<People> futureBuilderPeople() {
  return FutureBuilder<People>(
    future: getPeople(),
    builder: (BuildContext context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        return ListView.builder(
          itemCount: snapshot.data == null ? 0 : snapshot.data.persona.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: peopleBuilder(snapshot.data.persona[index]),
            );
          },
        );
      } else
        return Center(child: CircularProgressIndicator());
    },
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

//Articulos
FutureBuilder<Items> futureBuilderItems() {
  return FutureBuilder<Items>(
    future: getItem(),
    builder: (BuildContext context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        return ListView.builder(
          itemCount: snapshot.data == null ? 0 : snapshot.data.articulo.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: itemBuilder(snapshot.data.articulo[index]),
            );
          },
        );
      } else
        return Center(child: CircularProgressIndicator());
    },
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
