import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:jimkiarie8/main.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductDetails extends StatefulWidget {
  final product_index;
  // final product_detail_picture;
  // final product_detail_old_price;
  // final product_detail_price;

  ProductDetails({
    this.product_index,
    // this.product_detail_picture,
    // this.product_detail_old_price,
    // this.product_detail_price,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.indigo,
        title: Text('ActiveShop'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(widget.product_index['image']),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_index['product_name'],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "\$${widget.product_index['old_price']}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                          "\$${widget.product_index['price']}",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

//      =============== first button =============================
          Row(
            children: <Widget>[
//      =============== Size button =============================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Size"),
                            content: new Text("Choose the size"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(children: <Widget>[
                    Expanded(child: new Text("Size")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ]),
                ),
              ),

              //      =============== Color button =============================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Color"),
                            content: new Text("Choose the color"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(children: <Widget>[
                    Expanded(child: new Text("Color")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ]),
                ),
              ),

              //      =============== Qty button =============================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Qty"),
                            content: new Text("Choose the qty"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(children: <Widget>[
                    Expanded(child: new Text("Qty")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ]),
                ),
              ),
            ],
          ),

          //      =============== 2nd button =============================
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.blue[500],
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Buy now")),
              ),
              new IconButton(
                  icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.favorite_border), onPressed: () {}),
            ],
          ),

          Divider(),
          new ListTile(
            title: new Text("Product details"),
            subtitle: new Container(
              child: Html(
                  data: widget.product_index['description'],
                  padding: EdgeInsets.all(8.0),
                  onLinkTap: (url) {
                    print("Opening $url...");
                  }),
            ),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_index['product_name']),
              ),
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product brand",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("Uniqlo"),
              ),
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("New"),
              ),
            ],
          ),

          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Similar Products"),
          ),

//          Similar_products Section
          Container(
            height: 360,
            child: Similar_products(),
          )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {


  final String apiUrl = "http://192.168.43.81:82/api/related/3";
  // final String apiUrl = "http://d1ac5cf2.ngrok.io/api/products";
  // final String apiUrl = "https://randomuser.me/api/?results=10";

  Future<List<dynamic>> fetchRelated() async {
    var result = await http.get(apiUrl);
    return jsonDecode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchRelated(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
          // print('*******************************************');
          // print(snapshot);
          // print('*******************************************');
        if (snapshot.hasData) {
          // print('*******************************************');
          // print(snapshot);
          // print('*******************************************');
          return GridView.builder(
            itemCount: snapshot.data.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              var similar_products = snapshot.data[index];
              return Similar_single_prod(
                similar_index: similar_products,
              );
            },
          );
        }
      },
    );
  }
}

class Similar_single_prod extends StatelessWidget {
  final similar_index;

  final String apiUrl = "http://192.168.43.81:82/api/related/1";
  // final String apiUrl = "http://d1ac5cf2.ngrok.io/api/products";
  // final String apiUrl = "https://randomuser.me/api/?results=10";

  Future<List<dynamic>> fetchRelated() async {
    var result = await http.get(apiUrl);
    return jsonDecode(result.body)['data'];
  }


  Similar_single_prod({
    this.similar_index,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: similar_index['product_name'],
        child: Material(
          child: InkWell(
            onTap: () =>
                Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new ProductDetails(
                      //this will carry product data to another page
                      product_index: similar_index
                    ))),

            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: new Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        similar_index['product_name'],
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                    new Text(
                      "\$${similar_index['price']}",
                      style: TextStyle(color: Colors.black, fontSize: 12.0),
                    )
                  ],
                ),
              ),
              child: Image.network(
                similar_index['image'],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
