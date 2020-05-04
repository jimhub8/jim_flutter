import 'package:http/http.dart' as http;
import 'package:jimkiarie8/components/api/api.dart';
import 'dart:convert';

import 'package:jimkiarie8/components/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersApi {
  Future fetchLogedInUser() async {
    String loggenin_user = Api.MAIN_API_URL + Api.USER_URL;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + await _getToken()
    };
    var response = await http.get(loggenin_user, headers: headers);
    // var user = null;
    List<User> users = [];
    // print('***************************************');
    // print(await _getToken());
    // print(jsonDecode(response.body));
    // print('***************************************');

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      User user = User.fromJson(body);

    }
    return jsonDecode(response.body);
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '$token';
  }
}
