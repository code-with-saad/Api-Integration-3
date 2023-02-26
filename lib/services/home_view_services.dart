import 'dart:convert';

import 'package:api_integration_third/model/home_view_model.dart';
import 'package:http/http.dart' as http;

homedata() async {
  var url = "https://maaz-api.tga-edu.com/api/users";
  var baseurl = Uri.parse(url);
  var response = await http.get(baseurl);
  Map<String, dynamic> data = jsonDecode(response.body);
  return UserData.fromJson(data);
}
