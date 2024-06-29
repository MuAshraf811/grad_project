import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/constants/shared_pref_constants.dart';
import '../../../core/localStorage/shared_preferences_storage.dart';

class CategoryDataFetcher {
  static Future<List<dynamic>> getData() async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);
    final Map<String, String> headers = {
      "Authorization": "Bearer $bearerToken",
    };
    final res = await http.get(
      Uri.parse('https://ikseer.onrender.com/products/category/'),
      headers: headers,
    );

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }

    return [''];
  }
}
