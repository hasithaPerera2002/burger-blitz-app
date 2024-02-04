// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:burger_blitz/model/order.dart';
import 'package:http/http.dart' as http;

class OrderService {
  saveOrder(Order order) async {
    if (order.userId.isEmpty ||
        order.burgerId.isEmpty ||
        order.quantity == 0 ||
        order.price == 0) {
      log('Invalid order data', name: 'order_service.dart');
      return false;
    }
    try {
      final url = Uri.parse(
          'https://burger-shop-backend-hasitha-1.onrender.com/api/v1/orders');

      final jsonData = jsonEncode({
        'userId': order.userId,
        'burgerId': order.burgerId,
        'quantity': order.quantity,
        'price': order.price,
      });

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonData,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
