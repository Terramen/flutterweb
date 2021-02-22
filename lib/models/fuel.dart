// To parse this JSON data, do
//
//     final fuel = fuelFromJson(jsonString);

import 'dart:convert';

List<Fuel> fuelFromJson(String str) =>
    List<Fuel>.from(json.decode(str).map((x) => Fuel.fromJson(x)));

String fuelToJson(List<Fuel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fuel {
  Fuel({
    this.id,
    this.name,
    this.count,
    this.unit,
    this.price,
  });

  int id;
  String name;
  double count;
  String unit;
  double price;

  factory Fuel.fromJson(Map<String, dynamic> json) => Fuel(
        id: json["id"],
        name: json["name"],
        count: json["count"].toDouble(),
        unit: json["unit"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "count": count,
        "unit": unit,
        "price": price,
      };
}
