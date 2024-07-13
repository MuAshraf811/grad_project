import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants/shared_pref_constants.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';

class FetchingUserData {
  static Future<List<dynamic>> FetchInfo() async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);

    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    final response = await dio.get(
      'https://ikseer.azurewebsites.net/accounts/patient/',
      options: Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      await SharedPreferencesManager.storeStringVal(
          LocalStorageConstants.userId, response.data['results'][0]['id']);
      return response.data['results'];
    }
    throw Exception('error in post cart item');
  }
}
