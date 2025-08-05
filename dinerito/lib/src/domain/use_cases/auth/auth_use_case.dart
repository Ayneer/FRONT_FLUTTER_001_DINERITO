import 'package:dartz/dartz.dart';

import '../../../infrastructure/models/auth/request/login_request_model.dart';
import '../../../infrastructure/models/auth/request/register_request_model.dart';
import '../../../infrastructure/models/auth/response/login_response_model.dart';
import '../../../infrastructure/models/error_api_model.dart';
import '../../gateways/auth/export.dart';

class AuthUseCase {
  const AuthUseCase(this._authGateway);

  final AuthGateway _authGateway;

  Future<Either<ErrorApiModel, LoginResponseModel>> login(
    LoginRequestModel request,
  ) async {
    return _authGateway.login(request);
  }

  Future<Either<ErrorApiModel, LoginResponseModel>> register(
    RegisterRequestModel request,
  ) async {
    return _authGateway.register(request);
  }
}
