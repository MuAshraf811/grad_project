import 'package:dio/dio.dart';

class PharmacyDetaFetcher {
  static Future<List<dynamic>> getData() async {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
    final res =
        await dio.get('https://ikseer.azurewebsites.net/pharmacy/pharmacy/');

    if (res.statusCode == 200) {
      final decodedResponse = res.data;
      return decodedResponse['results'];
    }

    throw Exception('error in pharmacy endpoint');
  }
}
