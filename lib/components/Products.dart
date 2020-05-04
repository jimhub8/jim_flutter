import 'package:flutter/material.dart';
import 'package:jimkiarie8/components/api/api_utility.dart';
import 'package:jimkiarie8/components/pages/product_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Single_prod(),
    );
  }
}

class Single_prod extends StatelessWidget {
  final product_index;
  // final prod_picture;
  // final prod_old_price;
  // final prod_price;

  // final String apiUrl = "https://dellmat.com/api/products";
  final String apiUrl = ApiUtility.MAIN_API_URL + '/products';
  // final String apiUrl = "http://d1ac5cf2.ngrok.io/api/products";
  // final String apiUrl = "https://randomuser.me/api/?results=10";

  Future<List<dynamic>> fetchProducts() async {

          print('*******************************************');
    print(apiUrl);
          print('*******************************************');
          print('*******************************************');
    var result = await http.get(apiUrl);
    return jsonDecode(result.body)['data'];
  }

// var products_data =


  Single_prod({
    this.product_index,
    // this.prod_picture,
    // this.prod_old_price,
    // this.prod_price,
  });
  @override
  Widget build(BuildContext context) {
    // return Card(
    return FutureBuilder<List<dynamic>>(
      future: fetchProducts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // print((snapshot));
        if (snapshot.hasData) {
          // print(product_index['price']);
          // print('*******************************************');
          // print(snapshot.data);
          // print('*******************************************');
          return GridView.builder(
              itemCount: snapshot.data.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                var product_index = snapshot.data[index];

                return Card(
                  child: Hero(
                    tag: product_index['product_name'],
                    child: Material(
                      child: InkWell(
                        onTap: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) => new ProductDetails(
                                  product_index: product_index
                                ))),
                        child: GridTile(
                          footer: Container(
                            height: 40,
                            color: Colors.white54,
                            child: new Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    product_index['product_name'],
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                ),
                                new Text(
                                  "\$${product_index['price']}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                          child: Image.network(
                            product_index['image'],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
