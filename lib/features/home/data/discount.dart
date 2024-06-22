import 'dart:convert';

import 'package:http/http.dart' as http;

class DiscountDataFetcher {
  static Future<List<dynamic>> getData() async {
    final res = await http
        .get(Uri.parse('https://ikseer.onrender.com/products/discount/'));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }

    return [''];
  }
}
