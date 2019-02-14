import 'package:flutter/material.dart';

import '../models/people_model.dart';
import '../styles/styles.dart';

class PersonScreen extends StatelessWidget {
  final Persona persona;

  PersonScreen(this.persona);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.darkMS,
          title: Text('Ficha de persona', style: Styles.headerWhite),
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            ListTile(
                title: Text(
                  persona.name,
                  style: Styles.headerDark,
                ),
                subtitle: Text('Identificador: ${persona.id}')),
          ],
        ),
      ),
    );
  }
}
