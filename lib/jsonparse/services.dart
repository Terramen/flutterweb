import 'dart:convert';

import 'package:flutterweb/models/user-details.dart';
import 'package:http/http.dart' as http;
import 'package:flutterweb/models/station.dart';
import 'package:flutterweb/models/users.dart';
import 'package:flutterweb/models/order.dart';
import 'package:flutterweb/models/fuel.dart';

class Services {
  static const String url = "http://192.168.43.141:8080/test2";

  static const String url2 = "http://192.168.43.141:8080/personalAccount2";

  static const String url3 = "http://192.168.43.141:8080/fuel2";

  static const String url4 = "http://192.168.43.141:8080/test";

  static const String url5 = "http://192.168.43.141:8080/order";

  //static const String url = "http://jsonplaceholder.typicode.com/users";

  static int currentUserId;

  static setCurrentUser(int id) {
    currentUserId = id;
  }

  static Future<List<Station>> getStations() async {
    try {
      final response = await http.get(url4);
      if (200 == response.statusCode) {
        final List<Station> stations = stationFromJson(response.body);
        return stations;
      } else {
        return List<Station>();
      }
    } catch (e) {
      return List<Station>();
    }
  }

  static Future<List<Users>> getUsers() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<Users> users = usersFromJson(response.body);
        return users;
      } else {
        return List<Users>();
      }
    } catch (e) {
      return List<Users>();
    }
  }

  static Future<List<Order>> getOrders() async {
    try {
      final response = await http.get(url2);
      if (200 == response.statusCode) {
        final List<Order> orders = orderFromJson(response.body);
        return orders;
      } else {
        return List<Order>();
      }
    } catch (e) {
      return List<Order>();
    }
  }

  static Future<List<Fuel>> getFuels() async {
    try {
      final response = await http.get(url3);
      if (200 == response.statusCode) {
        final List<Fuel> fuels = fuelFromJson(response.body);
        return fuels;
      } else {
        return List<Fuel>();
      }
    } catch (e) {
      return List<Fuel>();
    }
  }

  static Future<List<Order>> getOrdersByUserId(int id) async {
    try {
      final response = await http.post(url2,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({"id": currentUserId}));
      if (200 == response.statusCode) {
        final List<Order> orders = orderFromJson(response.body);
        return orders;
      } else {
        return List<Order>();
      }
    } catch (e) {
      return List<Order>();
    }
  }
}
