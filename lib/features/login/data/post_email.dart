import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/shared_pref_constants.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:graduation_project/features/register/data/response_model.dart';

class PostEmailToGetOTP {
  static Future<ResponseModel> postEmail({
    required String email,
  }) async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);

    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    final response = await dio.post(
      'https://ikseer.azurewebsites.net/accounts/otp-by-email/',
      data: {
        "email": email,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
        },
      ),
    );

    debugPrint(
        ' **********************************************Hello post cart method*****************************************');
    if (response.statusCode == 201 ||
        response.statusCode == 200 ||
        response.statusCode == 204) {
      return ResponseModel(
          message: response.data['detail'], statusCode: response.statusCode!);
    } else if (response.statusCode == 400) {
      return ResponseModel(
          message: response.data['detail'], statusCode: response.statusCode!);
    }
    throw Exception('error in delete cart item');
  }
}
