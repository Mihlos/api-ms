import 'package:flutter/material.dart';

import '../models/people_model.dart';
import '../models/item_model.dart';

//CONSTRUCTOR DE FUTUROS
FutureBuilder futureBuilder(String type, method) {
  return FutureBuilder(
    future: method,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        if(type == 'Person')return peopleListViewBuilder(snapshot);
        if(type == 'Article')return itemsListViewBuilder(snapshot);
      } else
        return Center(child: CircularProgressIndicator());
    },
  );
}

//PERSONAS
ListView peopleListViewBuilder(AsyncSnapshot snapshot) {
  return ListView.builder(
    itemCount: snapshot.data == null ? 0 : snapshot.data.persona.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: peopleBuilder(snapshot.data.persona[index]),
      );
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

//ARTICULOS
ListView itemsListViewBuilder(AsyncSnapshot snapshot) {
  return ListView.builder(
    itemCount: snapshot.data == null ? 0 : snapshot.data.articulo.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: itemBuilder(snapshot.data.articulo[index]),
      );
    },
  );
}
Widget itemBuilder(Article article) {
  return Container(
    padding: EdgeInsets.all(20.0),
    child: Text(
      article.name,
      style: TextStyle(fontSize: 20.0),
    ),
  );
}
