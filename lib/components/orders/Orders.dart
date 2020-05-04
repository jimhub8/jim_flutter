import 'package:flutter/material.dart';
import 'package:jimkiarie8/components/orders/OrderList.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  var Products_on_the_cart = [
      {
        "name":"Uniqlo T-SHIRT 5",
        "picture": "images/products/un (1).png",
        "old_price": 18,
        "price": 14,
        "size": "M",
        "color": "Black",
        "quantity": "1",
      },
    {
      "name":"Uniqlo T-SHIRT 6",
      "picture": "images/products/un (6).png",
      "old_price": 18,
      "price": 14,
      "size": "S",
      "color": "White",
      "quantity": "1",
    },

    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.indigo,
          title: Text('My Orders'),
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
        ),
        body: new OrderList()
        );
  }
}
