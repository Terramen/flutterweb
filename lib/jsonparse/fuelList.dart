import 'package:flutter/material.dart';
import 'package:flutterweb/models/users.dart';
import 'services.dart';
import 'package:flutterweb/models/station.dart';
import 'package:flutterweb/models/order.dart';
import 'package:flutterweb/models/fuel.dart';

class FuelList extends StatefulWidget {
  FuelList() : super();

  @override
  FuelListState createState() => FuelListState();
}

class FuelListState extends State<FuelList> {
  //List<Station> _stations;
  List<Fuel> _fuels;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getFuels().then((fuels) {
      setState(() {
        _fuels = fuels;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "Loading..." : 'Fuels'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            // itemCount: null == _stations ? 0 : _stations.length,
            itemCount: null == _fuels ? 0 : _fuels.length,
            itemBuilder: (context, index) {
              //Station station = _stations[index];
              Fuel fuel = _fuels[index];
              return ListTile(
                title: Text(fuel.name),
                subtitle:
                    Text("Остаток " + fuel.count.toString() + " " + fuel.unit),
              );
            }),
      ),
    );
  }
}
