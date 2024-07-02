import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants/shared_pref_constants.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:graduation_project/features/register/data/response_model.dart';

class PostNewPasswords {
  static Future<ResponseModel> PostNewPassword({
    required String newPassword1,
    required String newPassword2,
  }) async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);

    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    final response = await dio.post(
      'https://ikseer.azurewebsites.net/accounts/password/change/',
      data: {
        "new_password1": newPassword1,
        "new_password2": newPassword2,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
        },
      ),
    );

    if (response.statusCode == 201 ||
        response.statusCode == 200 ||
        response.statusCode == 204) {
      return ResponseModel(
          message: response.data['detail'], statusCode: response.statusCode!);
    } else if (response.statusCode == 400) {
      return ResponseModel(
          message: response.data['new_password2'],
          statusCode: response.statusCode!);
    }
    throw Exception('error in delete cart item');
  }
}
