import 'dart:convert';

import 'package:api_integration_third/model/home_view_model.dart';
import 'package:http/http.dart' as http;

updatedata(id, data) async {
  try {
    var url = "https://maaz-api.tga-edu.com/api/users/$id";
    var baseurl = Uri.parse(url);
    var response = await http.put(baseurl,
        headers: {"content-type": "application/json"}, body: jsonEncode(data));
    return response;
  } catch (e) {
    print(e);
  }
}
