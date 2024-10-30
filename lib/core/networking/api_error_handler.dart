import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");

        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: "Invalid SSL certificate");

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "Receive timeout in connection with server");

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: "Send timeout in connection with server");

        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");

        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);

        default:
          return ApiErrorModel(message: "something went wrong");
      }
    } else {
      // default error
      return ApiErrorModel(message: "Unknown error occurred");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    code: data["code"],
    message: data["message"] ?? "Unknown error occurred",
    errors: data["data"],
  );
}
