import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PostLogInData {
  static Future<Map<String, dynamic>> postData({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('https://ikseer.onrender.com/accounts/login/');
    final response = await http.post(url, headers: {}, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
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
    } else {
      if (kDebugMode) {
        print('POST request failed with status code: ${response.body}');
        print(response.statusCode.toString());
      }
    }
    throw Exception('error in log in post email and password');
  }
}
