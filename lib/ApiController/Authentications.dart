import 'dart:convert';

import 'package:http/http.dart' as http;

class Authentication {
  static const String baseUrl = "http://192.168.29.71:3001";

  // SIGNIN
  static Future<Map<String, dynamic>> signIn(
      {String? email, String? password}) async {
    final http.Response response = await http.post(
        Uri.parse(baseUrl + "/login"),
        body: {"email": email, "password": password});
    return json.decode(response.body);
  }

  // SIGNUP
  static Future<Map<String, dynamic>> signup(
      {String? fName, String? lName, String? email, String? password}) async {
    print(fName);
    print(lName);
    print(email);
    print(password);
    final http.Response response =
        await http.post(Uri.parse(baseUrl + "/regis"),
            body: {
              "fName": fName,
              "lname": lName,
              "email": email,
              "password": password,
              "phone": 9075125922.toString()
            });
    return json.decode(response.body);
  }

  static void registeUser() {}
  static void forgorPassword() {}
}
