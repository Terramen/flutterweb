import 'package:flutter/material.dart';
import 'package:flutterweb/jsonparse/station-list.dart';
import 'jsonparse/fuelList.dart';
import 'jsonparse/order-list.dart';
import 'package:flutterweb/login-screen.dart';
import 'jsonparse/jsonParse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: JsonParse(),
      //home: FuelList(),
      //home: OrderList(),
      //home: StationList(),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        //'/a': (BuildContext context) => JsonParse(),
        '/b': (BuildContext context) => OrderList(),
        //'/fuel': (BuildContext context) => FuelList(),
      },
    );
  }
}
