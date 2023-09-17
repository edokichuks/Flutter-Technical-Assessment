import 'package:dio/dio.dart';
import 'package:kooha_task/src/src/core/services/config/exception/logger.dart';
import 'package:kooha_task/src/src/core/services/config/response/base_response.dart';
import 'package:kooha_task/src/src/features/profile/model/upload_file_response.dart';

class AppException {
  //HANDLE ERROR
  static BaseResponse<T> handleError<T>(
    DioException e, {
    T? data,
  }) {
    if (DioExceptionType.connectionError == e.type) {
      return BaseResponse(
          statusCode: 99, data: data, message: 'No Internet Connection');
    } else if (e.response != null && DioExceptionType.badResponse == e.type) {
      if (e.response == null ||
          DioExceptionType.badResponse != e.type &&
              e.response!.statusCode! >= 500) {
        return BaseResponse(
          statusCode: e.response!.statusCode!,
          message: "A server error occurred",
          data: data,
        );
      }
      if (e.response?.data is Map<String, dynamic>) {
        debugLog(BaseResponse.fromMap(e.response?.data));
        return BaseResponse.fromMap(e.response?.data);
      } else if (e.response?.data is String) {
        debugLog(e.response?.data);
        return BaseResponse(
          statusCode: e.response!.statusCode,
          message: e.response?.data,
          data: data,
        );
      }
    }
    return BaseResponse(
      statusCode: e.response?.statusCode,
      data: data,
      message: _mapException(e.type),
    );
  }

  static UploadFileResponse handleFileError<T>(
    DioException e,
    //  {
    // T? data,
    // }
  ) {
    if (e.response != null && DioExceptionType.badResponse == e.type) {
      if (e.response == null ||
          DioExceptionType.badResponse != e.type &&
              e.response!.statusCode! >= 500) {
        return UploadFileResponse(
          statusCode: e.response!.statusCode!,
          message: "A server error occurred",
          // data: data,
        );
      }
      if (e.response?.data is Map<String, dynamic>) {
        debugLog(UploadFileResponse.fromJson(e.response?.data));
        return UploadFileResponse.fromJson(e.response?.data);
      } else if (e.response?.data is String) {
        debugLog(e.response?.data);
        return UploadFileResponse(
          statusCode: e.response?.statusCode,
          message: e.response?.data,
          // data: data,
        );
      }
    }
    return UploadFileResponse(
      statusCode: e.response?.statusCode,
      // data: data,
      message: _mapException(e.type),
    );
  }

  static _mapException(DioExceptionType? error) {
    if (DioExceptionType.connectionTimeout == error ||
        DioExceptionType.receiveTimeout == error ||
        DioExceptionType.sendTimeout == error) {
      return 'Connection Time Out';
    } else if (DioExceptionType.unknown == error) {
      return 'Please check your internet connection';
    }
    return "A server error occurred";
  }
}
