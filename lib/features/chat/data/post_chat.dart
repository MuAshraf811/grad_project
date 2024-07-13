import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/constants/shared_pref_constants.dart';
import '../../../core/localStorage/shared_preferences_storage.dart';

class GetSingleChat {
  static Future<int> postChat({
    /* */
    required String chatId,
    required String text,
  }) async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);

    const url = 'https://ikseer.azurewebsites.net/chat/messages/';
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
      data: {"text": text, "conversation": chatId},
      options: Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
        },
      ),
    );
    final res = response.data;
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (kDebugMode) {
        print('post single message');
      }
      if (kDebugMode) {
        print(res.toString());
      }
      return response.statusCode!;
    } else if (response.statusCode == 400) {
      if (kDebugMode) {
        print(res.toString());
      }
      return response.statusCode!;
    }
    throw Exception('error in create chat');
  }

  static Future<List<dynamic>> getChat({
    /* */
    required String chatId,
  }) async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);

    final url =
        'https://ikseer.azurewebsites.net/chat/messages/?conversation=$chatId';
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
    } else if (response.statusCode == 400) {
      return res;
    }
    throw Exception('error in getting messages');
  }
}
