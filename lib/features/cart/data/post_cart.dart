import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants/shared_pref_constants.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:graduation_project/features/register/data/response_model.dart';

class CartPostDataToServer {
  static Future<ResponseModel> postCartItems(
      {required String productId,
      required String cartId,
      required int quantity}) async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);

    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    final response = await dio.post(
      'https://ikseer.onrender.com/orders/cart-item/',
      data: {
        "quantity": quantity,
        "cart": cartId,
        "product": productId,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
        },
      ),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return ResponseModel(message: 'done', statusCode: response.statusCode!);
    } else if (response.statusCode == 400) {
      return ResponseModel(message: 'Error', statusCode: response.statusCode!);
    }
    throw Exception('error in post cart item');
  }
}
