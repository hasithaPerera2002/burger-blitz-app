// ignore_for_file: avoid_print, unused_local_variable

import 'package:burger_blitz/const/userData.dart';

import '../model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  saveUser(User user) async {
    try {
      final url = Uri.parse(
          'https://burger-shop-backend-hasitha-1.onrender.com/api/v1/users');

      final jsonData = jsonEncode({
        'userName': user.fname,
        'secondName': user.lname,
        'email': user.email,
        'password': user.password,
      });

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonData,
      );

      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        kUserId = decode['user']['_id'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  login(String email, String password) async {
    try {
      final url = Uri.parse(
          'https://burger-shop-backend-hasitha-1.onrender.com/api/v1/users/login');

      final jsonData = jsonEncode({
        'email': email,
        'password': password,
      });

      var post = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonData,
      );

      if (post.statusCode == 200) {
        var decode = jsonDecode(post.body);
        kUserId = decode['userId'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
