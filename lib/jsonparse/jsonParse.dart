import 'package:flutter/material.dart';
import 'package:flutterweb/models/users.dart';
import 'services.dart';
import 'package:flutterweb/models/station.dart';
import 'package:flutterweb/models/order.dart';

class JsonParse extends StatefulWidget {
  JsonParse() : super();

  @override
  JsonParseState createState() => JsonParseState();
}

class JsonParseState extends State<JsonParse> {
  //List<Station> _stations;
  List<Users> _users;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    // Services.getStations().then((stations) {
    //   _stations = stations;
    //   _loading = false;
    // });
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "Loading..." : 'Users'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            // itemCount: null == _stations ? 0 : _stations.length,
            itemCount: null == _users ? 0 : _users.length,
            itemBuilder: (context, index) {
              //Station station = _stations[index];
              Users user = _users[index];
              return ListTile(
                title: Text(user.firstName + " " + user.lastName),
                subtitle: Text(user.email),
              );
            }),
      ),
    );
  }
}
