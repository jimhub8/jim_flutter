import 'package:flutter/material.dart';

class Products_copy extends StatefulWidget {
  @override
  _Products_copyState createState() => _Products_copyState();
}

class _Products_copyState extends State<Products_copy> {
  var product_list = [
    {
      "name": "T-SHIRT 5",
      "picture": "images/products/1.png",
      "old_price": 18,
      "price": 14,
    },
    {
      "name": "T-SHIRT 1",
      "picture": "images/products/2.png",
      "old_price": 18,
      "price": 14,
    },
    {
      "name": "T-SHIRT 2",
      "picture": "images/products/3.png",
      "old_price": 18,
      "price": 14,
    },
    {
      "name": "T-SHIRT 3",
      "picture": "images/products/4.png",
      "old_price": 18,
      "price": 14,
    },
    {
      "name": "T-SHIRT 4",
      "picture": "images/products/5.png",
      "old_price": 18,
      "price": 14,
    },
    {
      "name": "T-SHIRT 6",
      "picture": "images/products/6.png",
      "old_price": 18,
      "price": 14,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Single_pro(),
    );
  }
}

class Single_pro extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_price;
  final product_old_price;

  Single_pro({
    this.product_name,
    this.product_picture,
    this.product_price,
    this.product_old_price,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
