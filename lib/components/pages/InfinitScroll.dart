import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InfinitScroll extends StatefulWidget {
  @override
  _InfinitScrollState createState() => _InfinitScrollState();
}

class _InfinitScrollState extends State<InfinitScroll>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  List<String> product_list = new List();

  final String apiUrl = "http://192.168.43.81:82/api/products/";
  final page = 1;
  Future<List<dynamic>> fetchProducts() async {
    var response = await http.get(apiUrl);
          // print('*******************************************');
          // print('yeyyeyeyeyy');
          // print('*******************************************');
    // var response = await http.get(apiUrl + '?page=' + data);
    // return jsonDecode(result.body)['data'];
    // product_list.add(jsonDecode(response.body)['data']);
    return jsonDecode(response.body)['data'];
    // return jsonDecode(response.body['data']);
    // print('object');
  }

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    // fetchProducts();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // fetchProducts();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _controller.dispose();
  }

  Widget MyUI() {
    return FutureBuilder<List<dynamic>>(
        future: fetchProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return GridView.builder(
            itemCount: snapshot.data.length,
            controller: _scrollController,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Text(
                    'Now Its time to update the build and Show the UI. Here I am using CircularProgressIndicator because when you are fetching data from the Internet it may take some time. So it’s better to show Loading instead of Blank Screen.'),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MyUI();
  }
}
