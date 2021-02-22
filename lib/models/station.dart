// To parse this JSON data, do
//
//     final station = stationFromJson(jsonString);

import 'dart:convert';

List<Station> stationFromJson(String str) =>
    List<Station>.from(json.decode(str).map((x) => Station.fromJson(x)));

String stationToJson(List<Station> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Station {
  Station({
    this.id,
    this.location,
    this.phone,
    this.fuel,
  });

  int id;
  String location;
  String phone;
  String fuel;

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        id: json["id"],
        location: json["location"],
        phone: json["phone"],
        fuel: json["fuel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "phone": phone,
        "fuel": fuel,
      };
}
