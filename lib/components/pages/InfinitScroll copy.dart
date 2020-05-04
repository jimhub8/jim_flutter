import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InfinitScroll extends StatefulWidget {
  @override
  _InfinitScrollState createState() => _InfinitScrollState();
}

class _InfinitScrollState extends State<InfinitScroll> {
  List<String> product_list = new List();
  ScrollController _scrollController = new ScrollController();

  Widget myUi() {
    // fetch() async {
    //   final response = http.get("http://192.168.43.81:82/api/products");
    //   // if (response.statusCode == 200) {}
    //   setState(() {
    //     product_list.add(jsonDecode(response.body)['data']);
    //   });
    // }
    final String apiUrl = "http://192.168.43.81:82/api/products/";
    final page = 1;
    Future<List<dynamic>> fetchProducts(index) async {
      var response = await http.get(apiUrl + '?page=' + index);
      // var response = await http.get(apiUrl + '?page=' + data);
      // return jsonDecode(result.body)['data'];
      product_list.add(jsonDecode(response.body)['data']);

      // print('object');
    }

    @override
    void initState() {
      // TODO: implement initState
      fetchProducts(1);

      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          // fetchProducts();
        }
      });
      super.initState();
    }

    @override
    void dispose() {
      // TODO: implement dispose
      _scrollController.dispose();
      super.dispose();
    }

    return ListView.builder(itemBuilder: (context, index) {
      return FutureBuilder(
        future: fetchProducts(index),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var productInfo = snapshot.data;

                return ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text(productInfo['name']),
                  subtitle: Text('price: ${productInfo['price']}USD'),
                );
              }
              break;
            default:
              null;
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('*******************************************');
    // print(product_list);
    // print('*******************************************');

    return Card(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: product_list.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            constraints: BoxConstraints.tightFor(height: 150.0),
            child: Text('test text'),
          );
        },
      ),
    );
  }
}
