import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kooha_task/src/core/domain/repositories/login_responsitory.dart';
import 'package:kooha_task/src/core/services/config/configure_dependencies.dart';
import 'package:kooha_task/src/core/services/config/exception/app_exception.dart';
import 'package:kooha_task/src/core/services/config/response/base_response.dart';
import 'package:kooha_task/src/core/services/network/rest_client.dart';
import 'package:kooha_task/src/feature/auth/models/login_model.dart';
import 'package:kooha_task/src/feature/auth/models/login_response.dart';

class LoginImpl extends LoginRepo {
  final RestClient _client;

  LoginImpl(this._client);

  @override
  Future<BaseResponse<LoginResponse>> login(LoginModel loginModel) async {
    try {
      final resp = await _client.login(loginModel);
      return resp;
    } on DioException catch (ex) {
      return AppException.handleError(ex);
    }
  }
}

final loginRepoProv =
    Provider((ref) => LoginImpl(ref.read(restClientProvider)));
