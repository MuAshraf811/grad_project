import 'package:flutter/foundation.dart';
import 'package:graduation_project/features/register/data/response_model.dart';
import 'package:http/http.dart' as http;

class PostRegisterationData {
  static Future<ResponseModel> confirmWithOTP({required String otp}) async {
    //accounts/token/verify/
    final url = Uri.parse(
        'https://ikseer.azurewebsites.net/accounts/verify-email-otp/');
    final response = await http.post(url, headers: {}, body: {"otp": otp});
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('POST request successful!');
      }
      if (kDebugMode) {
        print('Response body: ${response.body}');
      }
    } else {
      if (kDebugMode) {
        print('POST request failed with status code: ${response.body}');
        print(response.statusCode.toString());
      }
    }
    return ResponseModel(
        message: response.body, statusCode: response.statusCode);
  }

  static Future<ResponseModel> postData({
    required String userNmae,
    required String email,
    required String password1,
    required String password2,
    required String firstName,
    required String lastName,
    required String gender,
  }) async {
    final url =
        Uri.parse('https://ikseer.azurewebsites.net/accounts/register/');
    final response = await http.post(url, headers: {}, body: {
      "username": userNmae,
      "email": email,
      "password1": password1,
      "password2": password2,
      "first_name": firstName,
      "last_name": lastName,
      "gender": gender
    });
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('POST request successful!');
      }
      if (kDebugMode) {
        print('Response body: ${response.body}');
      }
    } else {
      if (kDebugMode) {
        print('POST request failed with status code: ${response.body}');
        print(response.statusCode.toString());
      }
    }
    return ResponseModel(
        message: response.body, statusCode: response.statusCode);
  }
}
