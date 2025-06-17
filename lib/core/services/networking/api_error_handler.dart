import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static bool isErrorIsFail(String errorType) {
    switch (errorType.toLowerCase()) {
      case "failed":
        return true;
      default:
        return false;
    }
  }

  // TODO add to lang
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message: "Connection to the server failed due to internet connection",
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          // TODO handel status code errors
          return error.response?.data is Map
              ? _handleError(error.response?.data)
              : ApiErrorModel(message: "Something went wrong");
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: "Send timeout in connection with the server");
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return error is Map
          ? _handleError(error)
          : ApiErrorModel(message: "Something went wrong");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel.fromJson(data);
}
