import 'dart:convert';
import 'package:dio/dio.dart';

class PostLogInData {
  static Future<Map<String, dynamic>> postData({
    /* */
    required String email,
    required String password,
    required String username,
  }) async {
    const url = 'https://ikseer.azurewebsites.net/accounts/login/';
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
    final response = await dio.post(
      url,
      data: {"email": email, "password": password, "username": username},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final res = response.data;
      return {
        "token": res["access"],
        "profile_id": res['profile_id'],
        "code": response.statusCode,
        "massage": response.data
      };
    } else if (response.statusCode == 400) {
      final res = jsonDecode(response.data);
      return {
        "message": res["non_field_errors"],
        "code": response.statusCode,
      };
    }
    throw Exception('error in log in post email and password');
  }
}
