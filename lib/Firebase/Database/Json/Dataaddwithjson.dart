// To parse this JSON data, do
//
//     final dataaddwithjson = dataaddwithjsonFromJson(jsonString);

import 'dart:convert';

Dataaddwithjson dataaddwithjsonFromJson(String str) => Dataaddwithjson.fromJson(json.decode(str));

String dataaddwithjsonToJson(Dataaddwithjson data) => json.encode(data.toJson());

class Dataaddwithjson {
  String name;
  String password;

  Dataaddwithjson({
    required this.name,
    required this.password,
  });

  factory Dataaddwithjson.fromJson(Map<String, dynamic> json) => Dataaddwithjson(
    name: json["name"],
    password: json["Password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "Password": password,
  };
}
