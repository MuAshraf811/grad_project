// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:graduation_project/core/networking/api_constants.dart';
import 'package:graduation_project/core/networking/faliure.dart';

// Future<Either<Failure, ResponseDto>> getResponse(RequestDto requestDto) async {
//     if (await _networkInfo.isConnected) {
//       try {
//         ...
//         .
//         .
//         return Right(response);
//       } catch (error) {
//         return Left(ErrorHandler.handle(error).failure);
//       }
//     } else {
//       return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
//     }
//   }

enum DataSource {
  NO_CONTENT,
  SUCCESS,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}
class Handle{
 static Failure handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(code:error.response?.statusCode ?? 0,
            message:error.response?.statusMessage ?? "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    default:
      return DataSource.DEFAULT.getFailure();
  }
}

}
class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = Handle.handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}
class ResponseCode {
  // http response status code
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
  static const int API_LOGIC_ERROR = 422; // API , lOGIC ERROR

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String NO_CONTENT =
      ApiErrors.noContent;
       // success with no data (no content)
       static const String SUCCESS =
      ApiErrors.SUCCESS; 
  static const String BAD_REQUEST =
      ApiErrors.badRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      ApiErrors.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      ApiErrors.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static String CANCEL = ApiErrors.defaultError;
  static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  static String SEND_TIMEOUT = ApiErrors.timeoutError;
  static String CACHE_ERROR = ApiErrors.cacheError;
  static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static String DEFAULT = ApiErrors.defaultError;
}


extension DataSourceExtension on DataSource {
  Failure getFailure() {
    // var mContext = navigatorKey!.currentState!.context;
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(code: ResponseCode.SUCCESS, message:ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(code:ResponseCode.NO_CONTENT, message:ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(code:ResponseCode.BAD_REQUEST, message:ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(code:ResponseCode.FORBIDDEN, message:ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return Failure(code:ResponseCode.UNAUTORISED, message:ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return Failure(code:ResponseCode.NOT_FOUND, message:ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(code:ResponseCode.INTERNAL_SERVER_ERROR,
           message: ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            code:ResponseCode.CONNECT_TIMEOUT,message: ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(code:ResponseCode.CANCEL,message: ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
           code: ResponseCode.RECIEVE_TIMEOUT, message:ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(code:ResponseCode.SEND_TIMEOUT, message:ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(code :ResponseCode.CACHE_ERROR,message: ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(code:ResponseCode.NO_INTERNET_CONNECTION,
           message: ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(code:ResponseCode.DEFAULT,message: ResponseMessage.DEFAULT);
    }
  }
}