import 'package:flutter/material.dart';
import 'package:flutterweb/models/users.dart';
import 'services.dart';
import 'package:flutterweb/models/station.dart';
import 'package:flutterweb/models/order.dart';

class OrderList extends StatefulWidget {
  OrderList() : super();

  @override
  OrderListState createState() => OrderListState();
}

class OrderListState extends State<OrderList> {
  //List<Station> _stations;
  List<Order> _orders;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;

    // Services.getStations().then((stations) {
    //   _stations = stations;
    //   _loading = false;
    // });
    Services.getOrders().then((orders) {
      setState(() {
        _orders = orders;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "Loading..." : 'Orders'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            // itemCount: null == _stations ? 0 : _stations.length,
            itemCount: null == _orders ? 0 : _orders.length,
            itemBuilder: (context, index) {
              //Station station = _stations[index];
              Order order = _orders[index];
              return ListTile(
                title: Text(order.count.toString()),
                subtitle: Text(order.orderDate.toString()),
              );
            }),
      ),
    );
  }
}
