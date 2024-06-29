import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DoctorsDetaFetcher {
  static Future<List<dynamic>> getData() async {
    final res = await http
        .get(Uri.parse('https://ikseer.onrender.com/accounts/doctor/'));

    if (res.statusCode == 200) {
      debugPrint('Doctors get method');
      final decodedResponse = utf8.decode(res.bodyBytes);
      return jsonDecode(decodedResponse);
    }

    return [''];
  }
}
