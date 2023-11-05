import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/users.dart';

class ServicesUser {
  static const String url = "http://192.168.1.198:8080/api/users";

  static Future<Users> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseUsers(response.body);
      } else {
        return Users();
      }
    } catch (e) {
      print("error ${e.toString()}");
      return Users();
    }
  }

  static Users parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<User> users = parsed.map<User>((json) => User.fromJson(json)).toList();
    Users u = Users();
    u.users = users;
    return u;
  }

  static Future<http.Response> verifyUser(
      String userName, String password) async {
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, dynamic>{'userName': userName, 'password': password}));
    return response;
  }
}
