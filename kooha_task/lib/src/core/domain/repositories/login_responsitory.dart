
import 'package:kooha_task/src/core/services/config/response/base_response.dart';
import 'package:kooha_task/src/feature/auth/models/login_model.dart';
import 'package:kooha_task/src/feature/auth/models/login_response.dart';

abstract class LoginRepo {
  Future<BaseResponse<LoginResponse>> login(LoginModel loginModel);
}
