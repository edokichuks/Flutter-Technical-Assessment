import 'package:dio/dio.dart';
import 'package:kooha_task/src/core/services/config/exception/logger.dart';
import 'package:kooha_task/src/core/services/config/response/base_response.dart';

class AppException {
  //HANDLE ERROR
  static BaseResponse<T> handleError<T>(
    DioException e, {
    T? data,
  }) {
    if (e.response != null && DioExceptionType.badResponse == e.type) {
      if (e.response == null ||
          DioExceptionType.badResponse != e.type &&
              e.response!.statusCode! >= 500) {
        return BaseResponse(
          status: false,
          message: 'Server Error',
          data: data,
        );
      }
      if (e.response?.data is Map<String, dynamic>) {
        debugLog(BaseResponse.fromMap(e.response?.data).message);
        return BaseResponse.fromMap(e.response?.data);
      } else if (e.response?.data is String) {
        debugLog(e.response?.data);
        return BaseResponse(
          status: false,
          message: e.response?.data,
          data: data,
        );
      }
    }
    return BaseResponse(
      status: false,
      data: data,
      message: _mapException(e.type),
    );
  }

  static _mapException(DioExceptionType? error) {
    if (DioExceptionType.connectionTimeout == error ||
        DioExceptionType.receiveTimeout == error ||
        DioExceptionType.sendTimeout == error) {
      return 'Service Time Out';
    } else if (DioExceptionType.unknown == error) {
      return 'Connection Error';
    }
    return 'Error from Server';
  }
}
