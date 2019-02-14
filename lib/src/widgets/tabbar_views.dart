import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../screens/person_screen.dart';
import '../models/people_model.dart';
import '../models/item_model.dart';

List<Persona> personas;
List<Article> articulos;

//CONSTRUCTOR DE FUTUROS
FutureBuilder futureBuilder(String type, method) {
  return FutureBuilder(
    future: method,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        if (type == 'Person') return peopleListViewBuilder(snapshot);
        if (type == 'Article') return itemsListViewBuilder(snapshot);
      } else
        return Center(child: CircularProgressIndicator());
    },
  );
}

//PERSONAS
ListView peopleListViewBuilder(AsyncSnapshot snapshot) {
  personas = snapshot.data.persona;
  return ListView.builder(
      itemCount: snapshot.data == null ? 0 : personas.length,
      itemBuilder: (BuildContext context, int index) =>
          listTilePersona(context, personas[index]));
}

Widget listTilePersona(BuildContext context, Persona persona) {
  return ListTile(
      title: Text(persona.name),
      subtitle: Text('ID: ${persona.id}'),
      leading: Icon(
        Icons.person_outline,
        color: Styles.blueMS,
      ),
      onTap: () => _navigateToPersonDetail(context, persona));
}

void _navigateToPersonDetail(BuildContext context, Persona persona) {
  Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PersonScreen(persona),
      ));
}

//ARTICULOS
ListView itemsListViewBuilder(AsyncSnapshot snapshot) {
  return ListView.builder(
    itemCount: snapshot.data == null ? 0 : snapshot.data.articulo.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
//        child: peopleBuilder(snapshot.data.persona[index]),
        title: Text(snapshot.data.articulo[index].name),
        subtitle: Text('ID: ${snapshot.data.articulo[index].id}'),
        leading: Icon(
          Icons.layers,
          color: Styles.blueMS,
        ),
        onTap: () {},
      );
    },
  );
}
