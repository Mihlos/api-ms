// To parse this JSON data, do
//
//     final people = peopleFromJson(jsonString);

import 'dart:convert';

People peopleFromJson(String str) {
  final jsonData = json.decode(str);
  return People.fromJson(jsonData);
}

String peopleToJson(People data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class People {
  int count;
  int totalCount;
  List<Persona> persona;

  People({
    this.count,
    this.totalCount,
    this.persona,
  });

  factory People.fromJson(Map<String, dynamic> json) => new People(
    count: json["count"],
    totalCount: json["total_count"],
    persona: new List<Persona>.from(json["mg_entidad"].map((x) => Persona.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "total_count": totalCount,
    "mg_entidad": new List<dynamic>.from(persona.map((x) => x.toJson())),
  };
}

class Persona {
  int id;
  String name;

  Persona({
    this.id,
    this.name,
  });

  factory Persona.fromJson(Map<String, dynamic> json) => new Persona(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
