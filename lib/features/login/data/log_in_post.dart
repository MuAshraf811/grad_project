import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PostLogInData {
  static Future<Map<String, dynamic>> postData({
    required String email,
    required String password,
    required String username,
  }) async {
    final url = Uri.parse('https://ikseer.onrender.com/accounts/login/');
    final response = await http.post(url, headers: {}, body: {
      "email": email,
      "password": password,
      "username": username,
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      final res = jsonDecode(response.body);
      print(res.toString());

      if (kDebugMode) {
        print('POST request successful! in log in');
      }
      if (kDebugMode) {
        print('Response body: ${res['access']}');
      }
      return {
        "token": res["access"],
        "code": response.statusCode,
        "massage": response.body
      };
    } else if (response.statusCode == 400) {
      final res = jsonDecode(response.body);
      return {
        "message": res["non_field_errors"],
        "code": response.statusCode,
      };
    }
    throw Exception('error in log in post email and password');
  }
}
