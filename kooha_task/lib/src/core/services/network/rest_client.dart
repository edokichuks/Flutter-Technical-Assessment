import 'dart:io';
import 'package:dio/dio.dart';
import 'package:kooha_task/src/feature/auth/models/login_model.dart';
import 'package:kooha_task/src/feature/auth/models/login_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:kooha_task/src/core/services/config/response/base_response.dart';


part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/auth/login')
  Future<BaseResponse<LoginResponse>> login(@Body() LoginModel loginModel);
}
