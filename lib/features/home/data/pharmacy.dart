import 'dart:convert';

import 'package:http/http.dart' as http;

class PharmacyDetaFetcher {
  static Future<List<dynamic>> getData() async {
    final res = await http
        .get(Uri.parse('https://ikseer.azurewebsites.net/pharmacy/pharmacy/'));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }

    return ['mm'];
  }
}
