import 'package:http/http.dart' as http;
import 'package:jimkiarie8/components/models/Orders.dart';
import 'api_utility.dart';
import 'dart:convert';

class OrdersApi {
  Future<List<Order>> fetchOrders() async {
    String allCategories = ApiUtility.MAIN_API_URL + ApiUtility.ALL_ORDERS;
    Map<String, String> headers = {'Accept': 'application/json'};
    var response = await http.get(allCategories, headers: headers);
    
    List<Order> orders = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
        // print('***************************************');
        // print(body['data']);
        // print('***************************************');
      for (var item in body['data']) {

        Order order = Order.fromJson(item);
        orders.add(order);
      }
    }
    return orders;
  }
}
