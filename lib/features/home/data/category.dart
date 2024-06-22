import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryDataFetcher {
  static Future<List<dynamic>> getData() async {
    final res = await http
        .get(Uri.parse('https://ikseer.azurewebsites.net/products/category/'));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }

    return [''];
  }
}
