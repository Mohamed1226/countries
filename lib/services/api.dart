import 'package:http/http.dart' as http;

import 'dart:convert';

class Api {
  static Future<Map> callApi() async {
    Map data = {};
    String url = 'https://www.delivery-web.tk/api/v1/countries';
    http.Response response = await http.get(url);
    data = json.decode(response.body);
    return data;
  }
}
