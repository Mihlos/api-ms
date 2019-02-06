// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

Items itemsFromJson(String str) {
  final jsonData = json.decode(str);
  return Items.fromJson(jsonData);
}

String itemsToJson(Items data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Items {
  int count;
  int totalCount;
  List<Articulo> articulo;

  Items({
    this.count,
    this.totalCount,
    this.articulo,
  });

  factory Items.fromJson(Map<String, dynamic> json) => new Items(
    count: json["count"],
    totalCount: json["total_count"],
    articulo: new List<Articulo>.from(json["mg_articulo"].map((x) => Articulo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "total_count": totalCount,
    "mg_articulo": new List<dynamic>.from(articulo.map((x) => x.toJson())),
  };
}

class Articulo {
  int id;
  String ref;
  String name;

  Articulo({
    this.id,
    this.ref,
    this.name,
  });

  factory Articulo.fromJson(Map<String, dynamic> json) => new Articulo(
    id: json["id"],
    ref: json["ref"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ref": ref,
    "name": name,
  };
}