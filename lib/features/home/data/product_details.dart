import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductDetailsResFetcher {
  static Future<List<dynamic>> getData() async {
    final res = await http
        .get(Uri.parse('https://ikseer.azurewebsites.net/products/product/'));

    if (res.statusCode == 200) {
      final response = jsonDecode(res.body);
      return response['results'];
    }

    return [''];
  }
}
