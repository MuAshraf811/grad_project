import 'package:dio/dio.dart';

import '../../../core/constants/shared_pref_constants.dart';
import '../../../core/localStorage/shared_preferences_storage.dart';

class CreateChat {
  static Future<Map<String, dynamic>> createChat({
    /* */
    required String userId,
    required String doctorId,
  }) async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);

    const url = 'https://ikseer.azurewebsites.net/chat/conversations/';
    final dio = Dio();
    dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    final response = await dio.post(
      url,
      data: {"patient": userId, "doctor": doctorId},
      options: Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
        },
      ),
    );
    final res = response.data;
    if (response.statusCode == 200 || response.statusCode == 201) {
      return res;
    } else if (response.statusCode == 400) {
      return res;
    }
    throw Exception('error in create chat');
  }
}
