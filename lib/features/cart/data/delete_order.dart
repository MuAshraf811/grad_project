import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/shared_pref_constants.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:graduation_project/features/register/data/response_model.dart';

class DeleteOrderFromServer {
  static Future<ResponseModel> DeleteOrder({
    required String itemId,
  }) async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);

    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    final response = await dio.delete(
      'https://ikseer.azurewebsites.net/orders/cart-item/$itemId/',
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
      debugPrint(
          '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! cart delete sucess !!!!!!!!!!!!!!!!!!!!');
      return ResponseModel(
          message: response.data, statusCode: response.statusCode!);
    }
    throw Exception('error in delete cart item');
  }
}
