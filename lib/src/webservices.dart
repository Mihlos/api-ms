import 'package:http/http.dart' show get;
import 'dart:convert';
import 'dart:async';

import 'models/user_model.dart';
import 'models/item_model.dart';

const String apiKey = '?api_key=123456';
const String urlUsers =
    "http://manchasoft.ddns.net:4325/MCS/dbGestion_dat/v1/le_usuario";
const String urlItems =
    "http://manchasoft.ddns.net:4325/MCS/dbGestion_dat/v1/mg_articulo";


Future<UserTable> fetchUsersTable() async {
  final _response =  await get('$urlUsers$apiKey');
  return json.decode(_response.body);
  }

Future<Items> getItem() async {
  final _response = await get('$urlItems$apiKey');
  return itemsFromJson(_response.body);
}

