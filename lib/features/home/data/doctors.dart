import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';

import '../../../core/constants/shared_pref_constants.dart';

class DoctorsDetaFetcher {
  static Future<List<dynamic>> getData() async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);
    final res = await Dio().get(
      'https://ikseer.azurewebsites.net/accounts/doctor/',
      options: Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
        },
      ),
    );

    if (res.statusCode == 200) {
      debugPrint('Doctors get method');
      final decodedResponse = res.data;
      debugPrint(decodedResponse['results'].toString());
      return decodedResponse['results'];
    }

    return [''];
  }
}
