import 'package:dio/dio.dart';

import '../../../core/constants/shared_pref_constants.dart';
import '../../../core/localStorage/shared_preferences_storage.dart';

class CategoryDataFetcher {
  static Future<List<dynamic>> getData() async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);
    final Map<String, String> headers = {
      "Authorization": "Bearer $bearerToken",
    };
    final res = await Dio().get(
      'https://ikseer.azurewebsites.net/products/category/',
      options: Options(
        headers: headers,
      ),
    );

    if (res.statusCode == 200) {
      final ress = res.data;
      return ress['results'];
    }

    return [''];
  }
}
