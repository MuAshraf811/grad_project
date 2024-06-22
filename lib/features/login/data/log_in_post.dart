import 'package:flutter/foundation.dart';
import 'package:graduation_project/features/register/data/response_model.dart';
import 'package:http/http.dart' as http;

class PostLogInData {
  static Future<ResponseModel> postData({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('https://ikseer.azurewebsites.net/accounts/login/');
    final response = await http.post(url, headers: {}, body: {
      "email": email,
      "password": password,
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
