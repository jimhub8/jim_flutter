import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static const MAIN_API_URL = 'http://192.168.43.81:82/api';
  static const LOGIN = '/login';
  static const USER_URL = '/auth/user';
  // static const TOKEN = 
  // String TOKEN = '';

  postData(data, url) async {
    var api_url = MAIN_API_URL + url;
    print(api_url);
    return await http.post(api_url,
        body: jsonEncode(data), headers: setHeaders());
  }

  getData(data, url) async {
    var api_url = MAIN_API_URL + url;
    print(api_url);
    return await http.post(api_url,
        body: jsonEncode(data), headers: setHeaders());
  }

//  void setToken() async {
//       SharedPreferences localStorage = await SharedPreferences.getInstance();
//       localStorage.getString('token');

//   }

  setHeaders() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};
}
