import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;

import 'models/user_model.dart';

const String apiKey = '?api_key=123456';
const String urlUsers =
    "http://manchasoft.ddns.net:4325/MCS/dbGestion_dat/v1/le_usuario";

class DataApp extends StatefulWidget {
  @override
  _DataAppState createState() => _DataAppState();
}

class _DataAppState extends State<DataApp> {
  List<User> users;

  Future<String> fetchUsersTable() async {
    final response = await get('$urlUsers$apiKey');
    setState(() {
      final obtainedJson = json.decode(response.body);
      UserTable userTable = UserTable.fromJson(obtainedJson);
      users = userTable.users;
    });
    return 'Success!';
  }

  @override
  void initState() {
    super.initState();
    fetchUsersTable();
  }

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
              text: 'Usuarios',
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
            ListView.builder(
              itemCount: users == null ? 0 : users.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: userBuilder(users[index]),
                );
              },
            ),
            //Articulos
            Text('ARTICULOS'),
          ],
        ),
      ),
    );
  }

  Widget userBuilder(User user) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        user.name,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
