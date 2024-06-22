import 'package:dio/dio.dart';
import 'package:graduation_project/core/networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static Map<String, String> headers = {
    DioConstants.APPLICATION_JSON: DioConstants.APPLICATION_JSON,
    DioConstants.ACCEPT: DioConstants.APPLICATION_JSON,
    DioConstants.DEFAULT_LANGUAGE: DioConstants.DEFAULT_LANGUAGE
  };
  static getDio() async {
    Duration timeOut = const Duration(seconds: 60);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      // ..options.headers = headers
      // ..options.baseUrl = DioConstants.BASE_URL;
    } else {}
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
// DioConstants.AUTHORIZATION: DioConstants.TOKEN,