import 'package:flutter/material.dart';
import 'package:jimkiarie8/components/api/orders_api.dart';
import 'package:jimkiarie8/components/models/Orders.dart';

class OrderList extends StatefulWidget {
  OrderList({Key key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  OrdersApi ordersApi = OrdersApi();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: FutureBuilder(
        future: ordersApi.fetchOrders(),
        builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return _loading();
              break;
            case ConnectionState.waiting:
              return _loading();
              break;
            case ConnectionState.none:
              return _error('No connection made');
              break;

            case ConnectionState.done:
              if (snapshot.hasError) {
                return _error(snapshot.error.toString());
              }
              if (snapshot.hasData) {
                // return Container();
                return _drawOrdersList(snapshot.data);
              }
              break;
          }
          return Container();
        },
      ),
    );
  }

  Widget _loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _error(error) {
    return Container(
      child: Center(
        child: Text(
          error,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget _drawOrdersList(List<Order> orders) {
    print('*****************************');
    print(orders);
    print('*****************************');
    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int position) {
        print(orders[position].image);
          return InkWell(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Card(
                child: ListTile(
                  leading: new Image.network(
                    orders[position].image,
                    width: 80,
                    height: 80,
                  ),
                  title: new Text(
                    orders[position].order_no,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  subtitle: new Column(
                    children: <Widget>[
//            ====Product price section start====
                      new Container(
                        alignment: Alignment.topLeft,
                        child: new Text(
                          "\$${orders[position].total_price}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
//            ====Product price and Size start====
                      new Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: new Text("Size:"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: new Text(orders[position].total_price),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });

    // return Card(
//       child: ListTile(
//         leading: new Image.asset(
//           cart_prod_picture,
//           width: 80,
//           height: 80,
//         ),
//         title: new Text(
//           cart_prod_name,
//           style: TextStyle(
//               fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         subtitle: new Column(
//           children: <Widget>[
// //            ====Product price section start====
//             new Container(
//               alignment: Alignment.topLeft,
//               child: new Text(
//                 "\$${cart_prod_price}",
//                 style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black),
//               ),
//             ),
// //            ====Product price and Size start====
//             new Row(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(1.0),
//                   child: new Text("Size:"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(1.0),
//                   child: new Text(cart_prod_size),
//                 ),
//                 new Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
//                   child: new Text("Color:"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(1.0),
//                   child: new Text(cart_prod_color),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         trailing: new Column(
//           children: <Widget>[
//             new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
//             new Text('cart_prod_qty'),
//             new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
//           ],
//         ),
//       ),
    // );
  }
}
