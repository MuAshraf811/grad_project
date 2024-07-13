import 'package:dio/dio.dart';

import '../../../core/constants/shared_pref_constants.dart';
import '../../../core/localStorage/shared_preferences_storage.dart';

class ChatFetcher {
  ///chat/conversations/

  static Future<int> createChat({required String doctorId}) async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);
    final profileId =
        SharedPreferencesManager.getString(LocalStorageConstants.profileId);

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
      data: {"patient": profileId, "doctor": doctorId},
      options: Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
        },
      ),
    );

    return response.statusCode!;
  }

  static deleteChat(String id) async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);

    final url = 'https://ikseer.azurewebsites.net/chat/conversations/$id/';
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
    final response = await dio.delete(
      url,
      options: Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<List<dynamic>> getChats() async {
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
    final response = await dio.get(
      url,
      options: Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
        },
      ),
    );
    final res = response.data;
    if (response.statusCode == 200 || response.statusCode == 201) {
      return res['results'];
    }
    throw Exception('error in create chat');
  }
}
