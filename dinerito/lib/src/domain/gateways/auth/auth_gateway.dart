import 'package:dartz/dartz.dart';

import '../../../infrastructure/models/auth/request/login_request_model.dart';
import '../../../infrastructure/models/auth/request/register_request_model.dart';
import '../../../infrastructure/models/auth/response/login_response_model.dart';
import '../../../infrastructure/models/error_api_model.dart';

abstract class AuthGateway {
  Future<Either<ErrorApiModel, LoginResponseModel>> login(
    LoginRequestModel request,
  );
  Future<Either<ErrorApiModel, LoginResponseModel>> register(
    RegisterRequestModel request,
  );
}
