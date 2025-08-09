import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../configuration/env/env.dart';
import '../../../../domain/gateways/auth/export.dart';
import '../../../helpers/enum/http_request_type.dart';
import '../../../models/api_response_model.dart';
import '../../../models/auth/request/login_request_model.dart';
import '../../../models/auth/request/register_request_model.dart';
import '../../../models/auth/response/login_response_model.dart';
import '../../../models/error_api_model.dart';
import '../../mocks/auth/login_mock.dart';
import '../api.dart';

class AuthApi implements AuthGateway {
  AuthApi(this.context);
  final env = Env.getEnv;
  final BuildContext context;

  @override
  Future<Either<ErrorApiModel, LoginResponseModel>> login(
    LoginRequestModel request,
  ) async {
    final api = Api(
      context,
      withAuth: false,
    );
    final response = await api.call(
      '${env.baseApiUrl}${env.loginApi}',
      method: HttpRequestType.post,
      codeApiError: 'AUTH_01',
      data: request.fromObjectToMap(),
      mockResponse: ApiResponseModel.fromJson(loginMock),
    );

    return response.fold(
      (ErrorApiModel error) => Left<ErrorApiModel, LoginResponseModel>(error),
      (Map<String, dynamic> map) => Right<ErrorApiModel, LoginResponseModel>(
          LoginResponseModel.fromMap(map)),
    );
  }

  @override
  Future<Either<ErrorApiModel, LoginResponseModel>> register(
      RegisterRequestModel request) async {
    final api = Api(
      context,
      withAuth: false,
    );
    final response = await api.call(
      '${env.baseApiUrl}${env.registerApi}',
      method: HttpRequestType.post,
      codeApiError: 'AUTH_02',
      data: request.fromObjectToMap(),
      mockResponse: ApiResponseModel.fromJson(loginMock),
    );

    return response.fold(
      (ErrorApiModel error) => Left<ErrorApiModel, LoginResponseModel>(error),
      (Map<String, dynamic> map) => Right<ErrorApiModel, LoginResponseModel>(
          LoginResponseModel.fromMap(map)),
    );
  }
}
