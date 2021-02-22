import 'package:flutter/material.dart';
import 'package:flutterweb/models/users.dart';
import 'services.dart';
import 'package:flutterweb/models/station.dart';
import 'package:flutterweb/models/order.dart';

class StationList extends StatefulWidget {
  StationList() : super();

  @override
  StationListState createState() => StationListState();
}

class StationListState extends State<StationList> {
  List<Station> _stations;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getStations().then((stations) {
      setState(() {
        _stations = stations;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "Loading..." : 'Stations'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            // itemCount: null == _stations ? 0 : _stations.length,
            itemCount: null == _stations ? 0 : _stations.length,
            itemBuilder: (context, index) {
              //Station station = _stations[index];
              Station station = _stations[index];
              return ListTile(
                title: Text(station.location),
                subtitle: Text(station.phone),
              );
            }),
      ),
    );
  }
}
