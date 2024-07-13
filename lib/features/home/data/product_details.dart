import 'dart:convert';

import 'package:dio/dio.dart';

class ProductDetailsResFetcher {
  static Future<List<dynamic>> getData() async {
    final res =
        await Dio().get('https://ikseer.azurewebsites.net/products/product/');

    if (res.statusCode == 200) {
      final response = res.data;
      return response['results'];
    }

    return [''];
  }
}
