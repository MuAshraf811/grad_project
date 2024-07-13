import 'package:dio/dio.dart';

class DiscountDataFetcher {
  static Future<List<dynamic>> getData() async {
    final res =
        await Dio().get('https://ikseer.azurewebsites.net/products/discount/');

    if (res.statusCode == 200) {
      final ress = res.data;
      return ress['results'];
    }

    return [''];
  }
}
