import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/shared_pref_constants.dart';

class DoctorsDetaFetcher {
  static Future<List<dynamic>> getData() async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);
    final res = await http.get(
      Uri.parse('https://ikseer.onrender.com/accounts/doctor/'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'Accept': 'application/json',
      },
    );

    if (res.statusCode == 200) {
      debugPrint('Doctors get method');
      final decodedResponse = utf8.decode(res.bodyBytes);
      final ress = jsonDecode(decodedResponse);
      return ress['results'];
    }

    return [''];
  }
}
