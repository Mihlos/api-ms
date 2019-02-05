import 'package:http/http.dart' show get;
import 'dart:convert';


import 'models/user_model.dart';

const String apiKey = '?api_key=123456';
const String urlUsers =
    "http://manchasoft.ddns.net:4325/MCS/dbGestion_dat/v1/le_usuario";

class WebServices {

  Future<Map> fetchUsersTable() async {
    final _response =  await get('$urlUsers$apiKey');
    final _obtainedJson = json.decode(_response.body);
//    print(_obtainedJson['errors']);
    if(_obtainedJson['errors'] == null){
      return json.decode(_response.body);
//    print(usersTable.totalCount);
//    usersTable.users.forEach((User user) => print(user.name));
    }else{
      throw Exception('Fallo al obtener datos');
    }
  }
}
