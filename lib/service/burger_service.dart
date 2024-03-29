// ignore_for_file: avoid_print

import '../model/burger.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BurgerService {
  Future<List<Burger>> getBurgers() async {
    final response = await http.get(Uri.parse(
        'https://burger-shop-backend-hasitha-1.onrender.com/api/v1/burgers'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> burgersData = responseData['result'];

      return burgersData.map((json) => Burger.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load burgers');
    }
  }
}
