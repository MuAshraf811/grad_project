import 'dart:convert';

import 'package:http/http.dart' as http;

class PharmacyDetaFetcher {
  static Future<List<dynamic>> getData() async {
    final res = await http
        .get(Uri.parse('https://ikseer.onrender.com/pharmacy/pharmacy/'));

    if (res.statusCode == 200) {
      final decodedResponse = utf8.decode(res.bodyBytes);
      return jsonDecode(decodedResponse);
    }

    return ['mm'];
  }
}
