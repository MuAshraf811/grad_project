import 'package:dio/dio.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import '../../../core/constants/shared_pref_constants.dart';

class ItemsCartCall {
  static Future<List<dynamic>> getCartItems() async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);
    if (bearerToken == null || bearerToken.isEmpty) {
      throw Exception('Bearer token is missing or invalid');
    }
    // final headers = {
    //   'Authorization': 'Bearer $bearerToken',
    // };
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    final response = await dio.get(
      'https://ikseer.azurewebsites.net/orders/cart/',
      options: Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      await SharedPreferencesManager.storeStringVal(
          LocalStorageConstants.cartId, response.data['id']);
      await SharedPreferencesManager.storeStringVal(
          LocalStorageConstants.cartTotalPrice, response.data['total_price']);

      return response.data['items'];
    } else if (response.statusCode == 401) {
      debugPrint(response.data.toString());
    } else {
      debugPrint(response.data.toString());
    }
    throw Exception(response.data);
  }
}
