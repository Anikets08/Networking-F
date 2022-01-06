import 'package:http/http.dart' as http;

class Authentication {
  static const String baseUrl = "http://192.168.29.71:3001";
  static void signIn() async {
    final response = await http.post(Uri.parse(baseUrl + "/login"),
        body: {"email": "aniket123@gmail.com", "password": "aniket123"});
    try {
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  static void signOut() {}
  static void registeUser() {}
  static void forgorPassword() {}
}
