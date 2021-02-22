// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';
import 'package:flutterweb/models/station.dart';
import 'package:flutterweb/models/users.dart';
import 'package:flutterweb/models/fuel.dart';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    this.id,
    this.station,
    this.fuel,
    this.user,
    this.orderDate,
    this.count,
    this.price,
  });

  int id;
  Station station;
  Fuel fuel;
  Users user;
  DateTime orderDate;
  double count;
  double price;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        station: Station.fromJson(json["station"]),
        fuel: Fuel.fromJson(json["fuel"]),
        user: Users.fromJson(json["user"]),
        orderDate: DateTime.parse(json["orderDate"]),
        count: json["count"].toDouble(),
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "station": station.toJson(),
        "fuel": fuel.toJson(),
        "user": user.toJson(),
        "orderDate": orderDate.toIso8601String(),
        "count": count,
        "price": price,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
