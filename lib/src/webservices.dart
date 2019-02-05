import 'package:http/http.dart' show get;
import 'dart:convert';

import 'models/user_model.dart';

const String urlUsers =
    "http://manchasoft.ddns.net:4325/MCS/dbGestion_dat/v1/le_usuario?api_key=123456";

class FetchData {
  List<UserModel> customers = [];

  static void fetchCustomers() async{
    final response =  await get(urlUsers);
    final obtainedJson = json.decode(response.body);
    //print(obtainedJson["le_usuario"][0]);
    final customer = (obtainedJson["le_usuario"][0]);
    UserModel.fromJson(customer);
  }

  static fetchArticles(){

  }
}
